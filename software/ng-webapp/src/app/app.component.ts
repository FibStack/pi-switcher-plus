import { Component, OnInit } from '@angular/core';
import { AlertService } from './alert.service';
import { AppService } from './app.service';
import { AdcDevice, Board, RelayDevice } from './board/board.component';

@Component({
    selector: 'app-root',
    templateUrl: './app.component.html',
    standalone: false
})
export class AppComponent implements OnInit {

  boards: Board[] = [];

  constructor(private appService: AppService, private alertService: AlertService) { }

  ngOnInit() {
    this.appService.setBaseUrl(window.location.href);
    this.appService.getBoards().subscribe(
      res => {
        if (Array.isArray(res) && res.length > 0) {
          let adcChannel = 1;
          for (let i = 0; i < res.length; i++) {
            let raw_board = res[i];
            let board = new Board(i, raw_board.address, raw_board.description);
            for (let raw_device of raw_board.devices) {
              if (raw_device.value_type === "BOOLEAN") {
                board.devices.push(new RelayDevice(raw_device.id, raw_device.value));
              } else if (raw_device.value_type === "INTEGER") {
                board.devices.push(new AdcDevice(raw_device.id, adcChannel, raw_device.value));
                adcChannel++;
              }
            }
            this.boards.push(board);
          }
        }
      },
      err => this.alertService.push("Oops, cannot get the boards.", "danger")
    );
  }
}
