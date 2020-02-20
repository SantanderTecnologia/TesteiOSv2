import { TestBed, async } from '@angular/core/testing';

import { LocalStorageService } from './local-storage.service';

describe('LocalStorageService', () => {
  let service: LocalStorageService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(LocalStorageService);
  });
  it('should be created', () => {
    expect(service).toBeTruthy();
  });
  it("deve testar a chamada do método saveData", async(() => {
    spyOn(service, 'saveData').and.callThrough();
    service.saveData("data", "valorSalvo");
    expect(service.saveData).toHaveBeenCalled();
  }));
  it("deve testar a chamada do método get", async(() => {
    spyOn(service, 'get').and.callThrough();
    service.get("data");
    expect(service.get).toHaveBeenCalled();
  }));
  it("deve testar a chamada do método clearAllData", async(() => {
    spyOn(service, 'clearAllData').and.callThrough();
    service.clearAllData();
    expect(service.clearAllData).toHaveBeenCalled();
  }));
  it("deve testar a chamada do método getCookie", async(() => {
    spyOn(service, 'getCookie').and.callThrough();
    service.getCookie("data");
    expect(service.getCookie).toHaveBeenCalled();
  }));
  it("deve testar a chamada do método setCookie", async(() => {
    spyOn(service, 'setCookie').and.callThrough();
    service.setCookie("data", "valorSalvo", 365, "");
    expect(service.setCookie).toHaveBeenCalled();
  }));
  it("deve testar a chamada do método deleteCookie", async(() => {
    spyOn(service, 'deleteCookie').and.callThrough();
    service.deleteCookie("data");
    expect(service.deleteCookie).toHaveBeenCalled();
  }));


});
