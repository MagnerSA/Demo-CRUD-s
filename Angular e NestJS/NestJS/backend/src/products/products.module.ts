import { ProductService } from './shared/product.service';
import { ProductsController } from './products.controller';
import { Module } from '@nestjs/common';

@Module({
    controllers: [ProductsController],
    providers: [ProductService]
})
export class ProductsModule {}
