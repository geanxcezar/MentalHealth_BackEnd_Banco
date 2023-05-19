import { Module } from '@nestjs/common';
import { PsicologosService } from './psicologos.service';
import { PsicologosController } from './psicologos.controller';
import { PrismaService } from '../../database/PrismaService';

@Module({
  controllers: [PsicologosController],
  providers: [PsicologosService, PrismaService]
})
export class PsicologosModule { }
