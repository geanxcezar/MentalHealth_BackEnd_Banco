import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './database/PrismaService';
import { UsuariosModule } from './modules/usuarios/usuarios.module';
import { PacientesModule } from './modules/pacientes/pacientes.module';
import { PsicologosModule } from './modules/psicologos/psicologos.module';

@Module({  
  imports: [UsuariosModule, PacientesModule, PsicologosModule],
  controllers: [AppController],
  providers: [AppService, PrismaService]
})
export class AppModule {}
