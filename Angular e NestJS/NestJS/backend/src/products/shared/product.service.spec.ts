import { Test, TestingModule } from '@nestjs/testing';
import { ProductService } from './product.service';

describe('ProductService', () => {
  let provider: ProductService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ProductService],
    }).compile();

    provider = module.get<ProductService>(ProductService);
  });

  it('should be defined', () => {
    expect(provider).toBeDefined();
  });
});
