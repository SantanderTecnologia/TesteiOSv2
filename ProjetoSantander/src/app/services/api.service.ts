import { Injectable } from '@angular/core';

import { Observable, throwError, EMPTY, of } from 'rxjs';
import { catchError, tap, map, retry} from 'rxjs/operators';
import { HttpHeaders, HttpClient, HttpErrorResponse } from '@angular/common/http';
import { ApiConfig } from '../model/api-config.model';
import { DataLogin } from '../model/login-data.model';
import { UserAccount } from '../model/user-account.model';
import { Statement } from '@angular/compiler';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  readonly apiConfig:ApiConfig = {
    url:"https://bank-app-test.herokuapp.com/api/"
  }

  constructor(
    private http: HttpClient
  ) { }

  authentication(dataLogin:DataLogin):Observable<UserAccount[]>{
    let options = {headers:new HttpHeaders({'Content-Type':'aplication/json'})};
    let loginInfo = `user=${dataLogin.user}&password=${dataLogin.password}`;
    return this.http.post<any>(this.apiConfig.url + "login", loginInfo, options).pipe(
       retry(3), catchError(()=>{
         return EMPTY
       })
    ).pipe(catchError(err=>{
      this.handleError(err);
      return of(false)
    }));
  }
  getUserStatements(userID:number):Observable<Statement[]>{
    return this.http.get<any>(this.apiConfig.url + "statements/" + userID).pipe(
      retry(3), catchError(()=>{
        return EMPTY
      })
    ).pipe(catchError(err=>{
      this.handleError(err);
      return of(false)
    }));
  }


  private handleError(err:HttpErrorResponse){
    let errorMessage = '';
    if(err.error instanceof ErrorEvent){
      errorMessage =  `Houve um erro : ${err.error.message}`;
    }else{
      errorMessage =  `O servidor retornou o código : ${err.status}, mensagem de erro é : ${err.message}`; 
    }
    console.error(errorMessage);
    return throwError(errorMessage);
  }
}
