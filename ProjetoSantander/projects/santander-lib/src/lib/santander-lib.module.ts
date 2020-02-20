import { NgModule } from '@angular/core';
import { SantanderLibComponent } from './santander-lib.component';
import { PrimaryButtonComponent } from './components/primary-button/primary-button.component';



@NgModule({
  declarations: [SantanderLibComponent, PrimaryButtonComponent],
  imports: [
  ],
  exports: [SantanderLibComponent, PrimaryButtonComponent]
})
export class SantanderLibModule { }
