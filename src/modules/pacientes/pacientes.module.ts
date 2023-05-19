import { Module } from '@nestjs/common';
import { PacientesService } from './pacientes.service';
import { PacientesController } from './pacientes.controller';
import { PrismaService } from '../../database/PrismaService';

@Module({
  controllers: [PacientesController],
  providers: [PacientesService, PrismaService]
})
export class PacientesModule { }
