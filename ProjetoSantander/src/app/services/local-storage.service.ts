import { Injectable } from '@angular/core';
import { Observable, Subject, BehaviorSubject } from 'rxjs';
import { UtilService } from './util.service';

@Injectable({
  providedIn: 'root'
})
export class LocalStorageService {


  constructor(
    public utilService:UtilService
  ) { }

  saveData(key:string, value:any):any{
    if(this.utilService.getBrowserName() != "ie"){
      localStorage.setItem(key, JSON.stringify(value));
    }else{
      this.setCookie(key, value, 365, "");
    }
  }
  get(key: string): any {
    if(this.utilService.getBrowserName() != "ie"){
      var item = localStorage.getItem(key);
      if (item === "undefined") {
          item = undefined;
      } else {
          item = JSON.parse(item);
      }
      return item;
    }else{
      this.getCookie(key);
    }
  }
  clearAllData(){
    localStorage.clear();
    this.deleteCookie("data");
  }
  getCookie(name: string) {
    try {
      let ca: Array<string> = document.cookie.split(';');
      let caLen: number = ca.length;
      let cookieName = `${name}=`;
      let c: string;
  
      for (let i: number = 0; i < caLen; i += 1) {
          c = ca[i].replace(/^\s+/g, '');
          if (c.indexOf(cookieName) == 0) {
              return c.substring(cookieName.length, c.length);
          }
      }
    } catch (error) {
      
    }

    return undefined;
  }
   setCookie(name: string, value: string, expireDays: number, path: string = '') {
    try {
      let d:Date = new Date();
      d.setTime(d.getTime() + expireDays * 24 * 60 * 60 * 1000);
      let expires:string = `expires=${d.toUTCString()}`;
      let cpath:string = path ? `; path=${path}` : '';
      document.cookie = `${name}=${value}; ${expires}${cpath}`;
    } catch (error) {
      
    }

  }
   deleteCookie(name) {
    try {
      this.setCookie(name, '', -1);
    } catch (error) {
      
    }
    
  }


}
