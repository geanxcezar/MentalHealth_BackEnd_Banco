import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/database/PrismaService';
import { PsicologosDTO } from './psicologos.dto';

@Injectable()
export class PsicologosService {

    constructor(private prisma: PrismaService) { }

    //METODO PARA CRIAR UM PSICOLOGO
    async create(data: PsicologosDTO) {
        let { nome, crp, description,
            media, title, totalReviews,
            notaEstrelas, createdAt, bloqueado } = data
        const psicologos = await this.prisma.psicologos.create({
            data: {
                nome,
                crp,
                description,
                media,
                title,
                totalReviews,
                notaEstrelas,
                createdAt,
                bloqueado
            }
        });

        return psicologos;
    }
    findAll() {
        return this.prisma.psicologos.findMany({
            orderBy: [{
                nome: 'asc',
            }]

        })
    }

    //METODO PARA ALTERAR UM PSICOLOGO COM PASSAGEM DE PARAMETRO
    async update(id: number, data: PsicologosDTO) {
        return this.prisma.psicologos.update({
            where: {
                id: id
            },
            data: data
        })
    }
    //METODO PARA DELETAR UM PSICOLOGO
    async delete(id: number) {
        return await this.prisma.psicologos.delete({
            where: {
                id,
            },
        });
    }

}
