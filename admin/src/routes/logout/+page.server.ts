import { redirect } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';
import { logOut } from '$lib/server/auth';

export const load = (async (event) => {
    await logOut(event)
    throw redirect(303, "/login")
}) satisfies PageServerLoad;