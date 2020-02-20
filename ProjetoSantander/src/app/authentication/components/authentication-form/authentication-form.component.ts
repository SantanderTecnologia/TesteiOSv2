import { Component, OnInit, ɵConsole } from '@angular/core';
import { FormGroup, FormBuilder, Validators, AbstractControl } from '@angular/forms';
import { ApiService } from 'src/app/services/api.service';
import { DataLogin } from 'src/app/model/login-data.model';
import { UserService } from 'src/app/services/user.service';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { Router } from '@angular/router';
import { UtilService } from 'src/app/services/util.service';
import { StorageAccount } from 'src/app/model/storage-account.model';

@Component({
  selector: 'app-authentication-form',
  templateUrl: './authentication-form.component.html',
  styleUrls: ['./authentication-form.component.scss']
})
export class AuthenticationFormComponent implements OnInit {

  loginForm:FormGroup;
  submitted:boolean = false;
  errorLogin:boolean = false;
  errorServer:boolean = false;
  sucessAuthentication:boolean = false;
  storageAccount:StorageAccount = null;
  showProgressbar:boolean = false;
  validEmail:boolean = false;
  validCPF:boolean = false;
  bindInputUser:boolean = false;

  constructor(
    private utilService:UtilService,
    public router: Router,
    private apiService:ApiService,
    private formBuilder: FormBuilder,
    private userService:UserService,
    private localStorageService: LocalStorageService
  ) {
    if(this.userService.userAuthenticated){
      router.navigate(['/Home']);
    }
  }

  ngOnInit(): void {
    this.loginForm = this.formBuilder.group({
      username: ['', [Validators.required]],
      password: ['', [Validators.required, Validators.pattern(/(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\W+).*$/)]]
    });


  }

  ngAfterContentInit(){
    let storageData:any = null;
    try {
      storageData = this.localStorageService.get("data");
    } catch (error) {
    }
    if(storageData != undefined && storageData != null) {
      this.storageAccount = this.utilService.decryptData(storageData);
      this.loginForm.controls['username'].setValue(this.storageAccount.data);
      this.checkEmailOrCPF();
    }

  }

  submitForm():void{
    console.log("SubmitForm : " + this.loginForm.valid);
    this.submitted = true;
    if(this.loginForm.valid){
      let dataLogin:DataLogin ={
        user:this.loginForm.get('username').value,
        password:this.loginForm.get('password').value
      }
      this.logIn(dataLogin);
    }
  }
  logIn(dataLogin:DataLogin):void{
    console.log("validCPF : " + JSON.stringify(dataLogin));
    console.log("validEmail : " + this.validEmail);
    if(this.validCPF == true || this.validEmail == true){


      //######################################################
      //Simulação de recebimento dos dados após a autenticação, será retirado na versão final
      let simulatedData:any = this.mockLogin();
      this.userService.userAccount = simulatedData.userAccount;
      this.localStorageService.saveData("data", this.utilService.encryptData({data:dataLogin.user, userFullName:this.userService.userAccount.name}));
      this.userService.userAuthenticated = true;
      this.router.navigate(['/Home']);
      //######################################################
      this.showProgressbar = true;
      this.apiService.authentication(dataLogin).subscribe((data:any)=>{
        this.showProgressbar = false;
        if(data){
          try {
            this.userService.userAccount = data.userAccount;
            this.localStorageService.saveData("data", this.utilService.encryptData({data:dataLogin.user, userFullName:this.userService.userAccount.name}));
            this.userService.userAuthenticated = true;
            this.router.navigate(['/Home']);
            this.sucessAuthentication = true;
          } catch (error) {
            this.errorLogin = true;
            this.errorServer = true;
          }
        }else{
          this.showProgressbar = false;
          this.sucessAuthentication = false;
          this.errorServer = true;
        }
      }, error=>{
        this.showProgressbar = false;
        this.errorServer = true;
      });



    }



  }
  mockLogin():any{
    let loginReturn:any = {
      userAccount: {
          userId: 1,
          name: "Jose da Silva Teste",
          bankAccount: "2050",
          agency: "012314564",
          balance: 3.3445
      },
      error: {}
    }
    return loginReturn;
  }
  clearStorageAccount(){
    this.storageAccount = null;
    this.localStorageService.clearAllData();
    this.loginForm.controls['username'].setValue("");
    this.userService.userAccount = null;
  }


  checkEmailOrCPF():boolean{

    this.bindInputUser = true;

    if(!this.validateString()){
      //CPF
      console.log("PODE SER UM CPF");
      console.log("CPF VALIDO : " + this.isValidCpf(this.loginForm.get('username').value));

      if(this.isValidCpf(this.loginForm.get('username').value)){
        this.validCPF = true;
        this.validEmail =false;
        return true
      }else{
        this.validCPF = false;
        this.validEmail = false;
        return false;
      }
    }else{
      //E-MAIL
      console.log("EMAIL");
      console.log("EMAIL VALIDO : " + this.validateEmail(this.loginForm.get('username').value));

      if(this.validateEmail(this.loginForm.get('username').value)){
        this.validCPF = false;
        this.validEmail = true;
        return true;
      }else{
        this.validCPF = false;
        this.validEmail = false;
        return false;
      }
    }
  }
  validateString():boolean{
    try {
      //Verifica a existência de letras maíusculas
      if(this.loginForm.get('username').value.match(/(?=.*[A-Z]).*$/).length > 0) return true;
    } catch (error) {}
    try {
      //Verifica a existência de letras minúsculas
      if(this.loginForm.get('username').value.match(/(?=.*[a-z]).*$/).length > 0) return true;
    } catch (error) {}
    try {
      //Verifica a existência de caracteres especiais
      if(this.loginForm.get('username').value.match(/(?=.*\W+).*$/).length > 0) return true;
    } catch (error) {}

    return false;
  }
  isValidCpf(strCPF:string) {

    if(strCPF.length > 11) return false;

    let Soma:number;
    let Resto:number;

    Soma = 0;

    if (strCPF == "00000000000") return false;

    for (let i=1; i<=9; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (11 - i);
    Resto = (Soma * 10) % 11;

      if ((Resto == 10) || (Resto == 11))  Resto = 0;
      if (Resto != parseInt(strCPF.substring(9, 10)) ) return false;

    Soma = 0;
      for (let i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (12 - i);
      Resto = (Soma * 10) % 11;

      if ((Resto == 10) || (Resto == 11))  Resto = 0;
      if (Resto != parseInt(strCPF.substring(10, 11) ) ) return false;
      return true;

  }
  validateEmail(email:string){
    try {
      //Verifica a existência de letras maíusculas
      if(email.match(/(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/).length > 0){
        return true;
      }else{
        return false;
      }
    } catch (error) {
      return false;
    }
  }




}
