import { redirect } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';

export const load = (async ({locals:{client}, params}) => {
    const { ok, status, data } = await client.GET(`/api/pagos/${params.pago}`)
    if (!ok) {
        if (status == 404) {
            throw redirect(300, "/pagos")
        }
        return {}
    }

    console.log(data);
    let billetes = []
    if (data.metodo_pago.nombre === "Efectivo") {
        const { ok, data } = await client.GET("/api/billetes")
        if (!ok) {
            return {}
        }

        billetes = data.filter((bill: any) => bill.pago == params.pago)
    }

    const { ok: oke, data: estudiante } = await client.GET(`/api/students/${params.estudiante}`)
    if (!oke) {
        return {}
    }
    return {pago: data, billetes, estudiante};
}) satisfies PageServerLoad;