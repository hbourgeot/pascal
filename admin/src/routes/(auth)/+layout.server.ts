import { redirect } from '@sveltejs/kit';
import type { LayoutServerLoad } from './$types';
import { get } from 'svelte/store';

export const load: LayoutServerLoad = async ({locals:{user}}) => {
    if (user) {
        throw redirect(300, "/inicio")
    }
}