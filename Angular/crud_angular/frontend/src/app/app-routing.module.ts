import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ProductCreateComponent } from './components/product/product-create/product-create.component';
import { ProductUptadeComponent } from './components/product/product-uptade/product-uptade.component';

import { HomeComponent } from './views/home/home.component';
import { ProductCrudComponent } from './views/product-crud/product-crud.component';
import { ProductDeleteComponent } from './components/product/product-delete/product-delete.component';

const routes: Routes = [
  {
    path: "",
    component: HomeComponent
  },
  {
    path: "products",
    component: ProductCrudComponent
  },
  {
    path: "products/create",
    component: ProductCreateComponent
  },
  {
    path: "products/update/:id",
    component: ProductUptadeComponent
  },
  {
    path: "products/delete/:id",
    component: ProductDeleteComponent
  },


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
