import { Component, Input, OnInit } from '@angular/core';
import { interval } from 'rxjs';
import { AlertService } from '../alert.service';
import { AppService } from '../app.service';

@Component({
    selector: 'app-board',
    templateUrl: './board.component.html',
    standalone: false
})
export class BoardComponent implements OnInit {

  @Input()
  board: Board = new Board(0, 0, "");
  showSettings = false;
  newAddress = 0;
  changeAddressError = '';

  constructor(private appService: AppService, private alertService: AlertService) { }

  ngOnInit() {
    this.newAddress = this.board.address;
    interval(1000).subscribe(x => {
      if (this.board.address > 0 && this.board.devices.length > 0) {
        this.appService.getBoard(this.board.index).subscribe(
          res => this.updateBoard(res),
          err => this.alertService.push("Error while updating board information.", "danger")
        );
      }
    });
  }

  /**
   * Updates the current board with the new information
   * @param board 
   */
  updateBoard(board: any) {
    if (board && board.devices && board.devices.length == this.board.devices.length) {
      for (let i = 0; i < this.board.devices.length; i++) {
        let value = board.devices[i].value;
        let device = this.board.devices[i];
        if (device instanceof RelayDevice || device instanceof AdcDevice) {
          device.value = value;
        }
      }
    }
  }

  getAdcDevices(): AdcDevice[] {
    let adcDevices: AdcDevice[] = [];
    for (let device of this.board.devices) {
      if (device instanceof AdcDevice) {
        adcDevices.push(device);
      }
    }
    return adcDevices;
  }

  getRelayDevices(): RelayDevice[] {
    let relayDevices: RelayDevice[] = [];
    for (let device of this.board.devices) {
      if (device instanceof RelayDevice) {
        relayDevices.push(device);
      }
    }
    return relayDevices;
  }

  toggleSettings() {
    this.showSettings = !this.showSettings;
  }

  relayDeviceToggle(device: RelayDevice) {
    let setOjbect = {
      boardAddress: this.board.address,
      deviceId: device.id,
      newValue: !device.value
    };

    this.appService.setValue(setOjbect).subscribe(
      res => {
        device.value = res.value
      },
      err => this.alertService.push("Could not switch the realy device.", "danger")
    );
  }

  setBoardI2CAddress() {
    if (Number.isInteger(this.newAddress) && this.newAddress > 2 && this.newAddress < 120 && this.newAddress !== this.board.address) {

      let newAddress = {
        boardAddress: this.board.address,
        newAddress: this.newAddress
      };

      this.appService.setAddress(newAddress).subscribe(
        res => this.board.address = res.address,
        err => this.alertService.push("Could not set the new address.", "danger")
      );

    } else {
      this.changeAddressError = 'The new address value is invalid.';
    }
  }

}

export class Board {
  devices: Device[] = [];
  constructor(public index: number, public address: number, public description: string) {

  }
}

export interface Device { }

export class RelayDevice implements Device {
  constructor(public id: number, public value: boolean) { }
}

export class AdcDevice implements Device {
  constructor(public id: number, public channel: number, public value: number) { }
}