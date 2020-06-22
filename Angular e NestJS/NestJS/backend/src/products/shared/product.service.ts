import { Injectable } from '@nestjs/common';
import { Product } from './product';

@Injectable()
export class ProductService {
    products: Product[] = [
        {id: 1, name: "Banana", price: "0.50", shelfLife: "10/06/1999"},
        {id: 2, name: "Leite", price: "6.80", shelfLife: "20/07/2009"},
        {id: 3, name: "Cookie", price: "2.00", shelfLife: "15/01/2021"},
        {id: 4, name: "Bolinho", price: "3.50", shelfLife: "19/12/2012"},
    ]

    getAll() {
        return this.products;
    }

    getById(id: number) {
        const product = this.products.find((value) => value.id == id);
        return product;
    }

    create(product: Product) {
        let lastId = 0;
        if (this.products.length > 0) lastId = this.products[this.products.length - 1].id;

        product.id = lastId + 1;
        this.products.push(product);

        return product;

    }

    update(product: Product) {
        const productArray = this.getById(product.id);
        if (productArray) {
            productArray.name = product.name;
            productArray.price = product.price;
            productArray.shelfLife = product.shelfLife;
        }

        return productArray;
    }

    delete(id: number) {
        const index = this.products.findIndex((value) => value.id == id);
        this.products.splice(index, 1);
    }

}
