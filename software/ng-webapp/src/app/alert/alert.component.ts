import { Component } from '@angular/core';
import { Alert, AlertService } from '../alert.service';

@Component({
    selector: 'alerts',
    templateUrl: './alert.component.html',
    standalone: false
})
export class AlertComponent {

    constructor(private alertService: AlertService) { }

    get alerts() {
        return this.alertService.alerts;
    }

    closeAlert(alert: Alert) {
        this.alertService.remove(alert);
    }

}
