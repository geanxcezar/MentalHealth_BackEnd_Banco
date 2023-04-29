import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './database/PrismaService';
import { UsuariosModule } from './modules/usuarios/usuarios.module';

@Module({  
  imports: [UsuariosModule],
  controllers: [AppController],
  providers: [AppService, PrismaService]
})
export class AppModule {}
