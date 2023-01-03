import { Injectable } from '@angular/core';

@Injectable({
    providedIn: 'root'
})
export class AlertService {

    alerts: Alert[] = [];

    push(message: string, type: string) {
        let similarItemFound = false;
        for (let alert of this.alerts) {

            if (alert.type == type && alert.message == message) {
                alert.items++;
                similarItemFound = true;
                break;
            }
        }

        if (!similarItemFound) {
            this.alerts.push(new Alert(message, type, 1));
        }
    }

    remove(alert: Alert) {
        let index = this.alerts.indexOf(alert);

        if (index > -1) {
            this.alerts.splice(index, 1);
        }
    }
}


export class Alert {
    constructor(public message: string, public type: string, public items: number) { }
}