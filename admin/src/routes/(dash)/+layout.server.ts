import { redirect } from '@sveltejs/kit';
import type { LayoutServerLoad } from './$types';

export const load = (async ({ locals: { user } }) => {
    $:console.log(user);
    if (!user) {
        throw redirect(300, "/login")
    }
    return {user};
}) satisfies LayoutServerLoad;