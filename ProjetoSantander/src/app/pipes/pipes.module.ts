import { NgModule } from '@angular/core';
import { FormatAccountNumberPipe } from './format-account-number.pipe';

@NgModule({
    imports:[],
    declarations:[FormatAccountNumberPipe],
    exports: [FormatAccountNumberPipe],
})

export class PipeModule {

  static forRoot() {
     return {
         ngModule: PipeModule,
         providers: [],
     };
  }
} 