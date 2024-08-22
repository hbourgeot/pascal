import type { Actions } from "@sveltejs/kit";

export const passwordAction: Actions = {
  changePassword: async ({ locals: { client }, request, url }) => {
    let {
      endpoint,
      ...obj
    }: {
      current_password?: string;
      new_password?: string;
      endpoint?: string;
    } = Object.fromEntries(await request.formData()) as any;

    if(endpoint==="" || endpoint === null || endpoint === undefined) {
      const route = url.pathname.split('/')[1];
      
      switch (route){
        case "estudiantes":
          endpoint = "estudiantes";
          break;
        case "control_estudio":
          endpoint =  "control";
          break;
        case "docentes":
          endpoint = "docente";
          break;
        case "superusuario":
          endpoint = "superUsuario";
          break;
        case "coordinadores":
          endpoint = "coordinacion"
        default:
          endpoint = "";
      }
    }

    const { ok, status, data } = await client.PATCH(
      `/api/${endpoint}/update-password`,
      obj
    );

    if (!ok) return { status, errors: { message: data.message } };

    return { message: "Contraseña actualizada correctamente" };
  },
};
