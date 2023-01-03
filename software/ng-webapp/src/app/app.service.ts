import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AppService {

  private baseUrl = "";

  constructor(private http: HttpClient) { }

  setBaseUrl(url: string) {
    const parsedUrl = new URL(url);
    this.baseUrl = parsedUrl.origin;
  }

  getBoards(): Observable<any> {
    return this.http.get<any>(this.baseUrl + "/boards");
  }

  getBoard(id: number): Observable<any> {
    return this.http.get<any>(this.baseUrl + "/boards/index/" + id);
  }

  setValue(setObject: any): Observable<any> {
    return this.http.post(this.baseUrl + "/set", setObject);
  }

  setAddress(newAddress: any): Observable<any> {
    return this.http.post(this.baseUrl + "/set-address", newAddress);
  }
}
