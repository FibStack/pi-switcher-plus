import { provideHttpClient, withInterceptorsFromDi } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { AlertService } from './alert.service';
import { AlertComponent } from './alert/alert.component';

import { AppComponent } from './app.component';
import { AppService } from './app.service';
import { BoardComponent } from './board/board.component';
import { FooterComponent } from './footer/footer.component';
import { HeaderComponent } from './header/header.component';

@NgModule({ declarations: [
        AppComponent,
        BoardComponent,
        AlertComponent,
        FooterComponent,
        HeaderComponent
    ],
    bootstrap: [AppComponent, HeaderComponent, FooterComponent], imports: [BrowserModule,
        FormsModule], providers: [AppService, AlertService, provideHttpClient(withInterceptorsFromDi())] })
export class AppModule { }
