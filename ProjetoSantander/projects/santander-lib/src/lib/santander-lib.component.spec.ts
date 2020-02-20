import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SantanderLibComponent } from './santander-lib.component';

describe('SantanderLibComponent', () => {
  let component: SantanderLibComponent;
  let fixture: ComponentFixture<SantanderLibComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SantanderLibComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SantanderLibComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
