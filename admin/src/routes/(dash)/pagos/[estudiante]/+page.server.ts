import { fail, redirect } from '@sveltejs/kit';
import type { Actions, PageServerLoad } from './$types';
import { systemLogger } from '$lib/server/logger';

export const load = (async ({locals:{client, user}, params, url}) => {
    const { ok, data } = await client.GET(`/api/students/${params.estudiante}`)
    const { ok: okey, data: pagos } = await client.GET("/api/pagos")
    const { ok: okC, data: config } = await client.GET("/api/config/1")
    const tipo = url.searchParams.get("tipo");
    if (!ok || !okey || !okC) {
        return {}
    }
    let pagosEstudiante =
      tipo === "todos"
        ? pagos
            .filter((pago: any) => pago.estudiante === params.estudiante)
            .filter(
              (pago: any, index: any, self: any) =>
                index === self.findIndex((t: any) => t.id === pago.id)
            )
        : pagos
            .filter(
              (pago: any) =>
                pago.estudiante === params.estudiante &&
                pago.ciclo == config.ciclo
            )
            .filter(
              (pago: any, index: any, self: any) =>
                index === self.findIndex((t: any) => t.id === pago.id)
            );
    
    console.log(pagosEstudiante);
    systemLogger.info(user.nombre + " está viendo los pagos realizados por el estudiante " + data.nombre.toUpperCase())
    
    return {
        estudiante: data,
        pagos: pagosEstudiante
    };
}) satisfies PageServerLoad;