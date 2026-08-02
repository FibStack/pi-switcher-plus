import { Component, ChangeDetectionStrategy } from '@angular/core';
import * as PackageJson from '../../../package.json'

@Component({
    selector: 'app-header',
    templateUrl: './header.component.html',
    changeDetection: ChangeDetectionStrategy.Eager,
    standalone: false
})
export class HeaderComponent {

  packageInfo = PackageJson;
  currentVersion = this.packageInfo.version;

}
