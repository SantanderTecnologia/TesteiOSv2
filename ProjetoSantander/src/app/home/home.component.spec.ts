import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { RouterTestingModule } from '@angular/router/testing';
import { HomeComponent } from './home.component';
import { PipeModule } from '../pipes/pipes.module';
import { AuthenticationComponent } from '../authentication/authentication.component';

describe('HomeComponent', () => {
  let component: HomeComponent;
  let fixture: ComponentFixture<HomeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HomeComponent ],
      imports: [
        PipeModule,
        HttpClientTestingModule,
        RouterTestingModule.withRoutes([
          { path: 'Home', component: HomeComponent},
          { path: 'Authentication', component: AuthenticationComponent}
      ])],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    component.userService.userAccount = {
      userId: 1,
      name: "Jose da Silva Teste",
      bankAccount: "2050",
      agency: "012314564",
      balance: 3.3445
    }
    expect(component).toBeTruthy();
  });

  it("deve retornar os dados do extrato do usuário Mockados", async(() => {
    let statementReturn:any = {
      statementList: [
          {
              title: "Pagamento",
              desc: "Conta de luz",
              date: "2018-08-15",
              value: -50
          },
          {
              title: "TED Recebida",
              desc: "Joao Alfredo",
              date: "2018-07-25",
              value: 745.03
          },
          {
              title: "DOC Recebida",
              desc: "Victor Silva",
              date: "2018-06-23",
              value: 399.9
          },
          {
              title: "Pagamento",
              desc: "Conta de internet",
              date: "2018-05-12",
              value: -73.4
          },
          {
              title: "Pagamento",
              desc: "Faculdade",
              date: "2018-09-10",
              value: -500
          },
          {
              title: "Pagamento",
              desc: "Conta de telefone",
              date: "2018-10-17",
              value: -760
          },
          {
              title: "TED Enviada",
              desc: "Roberto da Luz",
              date: "2018-07-27",
              value: -35.67
          },
          {
              title: "Pagamento",
              desc: "Boleto",
              date: "2018-08-01",
              value: -200
          },
          {
              title: "TED Recebida",
              desc: "Salário",
              date: "2018-08-21",
              value: 1400.5
          }
      ],
      error: {}
  }
    expect(component.mockStatement()).toEqual(statementReturn);
  }));
  it('deve sair da aplicação', () => {
    spyOn(component, 'exit').and.callThrough();
    component.exit();
    expect(component.userService.userAuthenticated).toBeFalsy();
    expect(component.exit).toHaveBeenCalled();
  });
  it("deve testar a chamada do método getData", async(() => {
    spyOn(component, 'getData').and.callThrough();
    component.getData();
    expect(component.getData).toHaveBeenCalled();
    expect(component.searchStatus).toBeTrue();
  }));
});
