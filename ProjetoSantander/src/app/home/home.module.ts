import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { HomeRoutingModule } from './home-routing.module';
import { HomeComponent } from './home.component';
import { PipeModule } from '../pipes/pipes.module';
import { CardComponent } from './card/card.component';


@NgModule({
  declarations: [HomeComponent, CardComponent],
  imports: [
    CommonModule,
    HomeRoutingModule,
    PipeModule.forRoot()
  ]
})
export class HomeModule { }
