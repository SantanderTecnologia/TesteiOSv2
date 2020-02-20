import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AuthenticationFormComponent } from './authentication-form.component';
import { FormBuilder } from '@angular/forms';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { DataLogin } from 'src/app/model/login-data.model';
import { UserAccount } from 'src/app/model/user-account.model';
import { RouterTestingModule } from '@angular/router/testing';
import { HomeComponent } from 'src/app/home/home.component';

describe('AuthenticationFormComponent', () => {
  let component: AuthenticationFormComponent;
  let fixture: ComponentFixture<AuthenticationFormComponent>;
  const formBuilder: FormBuilder = new FormBuilder();

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      imports: [
        HttpClientTestingModule,
        RouterTestingModule.withRoutes([
          { path: 'Home', component: HomeComponent}
      ])],
      declarations: [ AuthenticationFormComponent ],
      providers: [
        HttpClientTestingModule,
        { provide: FormBuilder, useValue: formBuilder }
      ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AuthenticationFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it(`deve ser um formulário válido`, () => {
    let username = component.loginForm.controls["username"];
    let password = component.loginForm.controls["password"];
    username.setValue("joao");
    password.setValue("Uj#132456");
    expect(component.loginForm.valid).toBeTruthy();
  });

  it(`deve ser um formulário inválido`, () => {
    let username = component.loginForm.controls["username"];
    let password = component.loginForm.controls["password"];
    username.setValue("joao");
    password.setValue("123");
    expect(component.loginForm.valid).toBeFalse();
  });

  it("deve testar a chamada do método de login", async(() => {
    let dataLogin:DataLogin = {
      user:"thiago",
      password:"Hf$13579"
    }
    
    spyOn(component, 'logIn').and.callThrough();
    component.logIn(dataLogin);
    expect( component.logIn).toHaveBeenCalled();
  }));

  it("deve testar a chamada do método de submitForm", async(() => {
    spyOn(component, 'submitForm').and.callThrough();
    component.submitForm();
    expect(component.submitForm).toHaveBeenCalled();
    expect(component.submitted).toEqual(true);
  }));

  it("deve retornar os dados do usuário autenticado", async(() => {
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
    expect(component.mockLogin()).toEqual(loginReturn);
  }));

  it('deve limpar os dados salvos do usuário na sessão anterior', () => {
    spyOn(component, 'clearStorageAccount').and.callThrough();
    component.clearStorageAccount();
    expect(component.clearStorageAccount).toHaveBeenCalled();
  });



  it("deve verificar um cpf válido", async(() => {
    expect(component.isValidCpf("37210456880")).toEqual(true);
  }));
  it("deve verificar um cpf INválido", async(() => {
    expect(component.isValidCpf("17210456880")).toEqual(false);
  }));
  it("deve verificar um email válido", async(() => {
    expect(component.validateEmail("contato@everis.com")).toEqual(true);
  }));
  it("deve verificar um email inválido", async(() => {
    expect(component.validateEmail("contatoeveris")).toEqual(false);
  }));

  it("deve verificar se o usuário contém letras minusculas", async(() => {
    let username = component.loginForm.controls["username"];
    let password = component.loginForm.controls["password"];
    username.setValue("joao");
    password.setValue("Uj#132456");
    expect(component.validateString()).toEqual(true);
  }));
  it("deve verificar se o usuário contém letras maiusculas", async(() => {
    let username = component.loginForm.controls["username"];
    let password = component.loginForm.controls["password"];
    username.setValue("Joao");
    password.setValue("Uj#132456");
    expect(component.validateString()).toEqual(true);
  }));
  it("deve verificar se o usuário contém letras caracteres especiais", async(() => {
    let username = component.loginForm.controls["username"];
    let password = component.loginForm.controls["password"];
    username.setValue("joao$");
    password.setValue("Uj#132456");
    expect(component.validateString()).toEqual(true);
  }));
  it("deve verificar se o usuário não contém letras amiusculas ou minusculas nem caracteres especiais", async(() => {
    let username = component.loginForm.controls["username"];
    let password = component.loginForm.controls["password"];
    username.setValue("12312412");
    password.setValue("Uj#132456");
    expect(component.validateString()).toEqual(false);
  }));
});
