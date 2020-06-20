import { Router, ActivatedRoute } from '@angular/router';
import { ProductService } from './../product.service';
import { Component, OnInit } from '@angular/core';
import { Product } from '../product.model';


@Component({
  selector: 'app-product-uptade',
  templateUrl: './product-uptade.component.html',
  styleUrls: ['./product-uptade.component.css']
})
export class ProductUptadeComponent implements OnInit {
  product: Product;

  constructor(private productService: ProductService, private router: Router, private route: ActivatedRoute) { }

  ngOnInit(): void {
    const id = this.route.snapshot.paramMap.get('id')
    this.productService.readById(id).subscribe(product => {
      this.product = product
    })
  }

  updateProduct(): void {
    this.productService.update(this.product).subscribe(() => {
      this.productService.showMessage('Produto Atualizado!');
      this.router.navigate(["products"]);

    })
  }

  cancel(): void {
    this.router.navigate(['products'])
  }


}
