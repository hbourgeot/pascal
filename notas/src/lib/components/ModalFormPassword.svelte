<script lang="ts">
  import { triggerToast } from "$lib/utils/toast";
  import { writable, derived, get } from "svelte/store";
  import { modalStore } from "@skeletonlabs/skeleton";
  import PasswordInput from "./PasswordInput.svelte";
  import { enhance } from "$app/forms";

  // Props
  export let parent: any;
  export let endpoint: string = "";
  export let token: string = ""; // Recibe el token como prop

  // Form Data
  const formData = writable({
    clave: "",
    nueva_clave: "",
    confirmar_clave: "",
  });

  // Validations
  const validations = writable({
    length: false,
    lowercase: false,
    uppercase: false,
    number: false,
    specialChar: false,
    match: false,
  });

  const validatePassword = (password: string) => {
    validations.update((v) => ({
      ...v,
      length: password.length >= 8 && password.length <= 16,
      lowercase: /[a-z]/.test(password),
      uppercase: /[A-Z]/.test(password),
      number: /\d/.test(password),
      specialChar: /[!@#$%^&*(),.?":{}|<>]/.test(password),
    }));
  };

  const validateConfirmPassword = (
    password: string,
    confirmPassword: string
  ) => {
    validations.update((v) => ({
      ...v,
      match: password === confirmPassword,
    }));
  };

  // Computed
  const isFormValid = derived(
    validations,
    ($validations) =>
      $validations.length &&
      $validations.lowercase &&
      $validations.uppercase &&
      $validations.number &&
      $validations.specialChar &&
      $validations.match
  );

  // Base Classes
  const cBase = "card p-4 w-modal shadow-xl space-y-4";
  const cHeader = "text-2xl font-bold";
  const cForm = "p-4 space-y-4 rounded-container-token";
</script>

<!-- @component This example creates a simple form modal. -->
{#if $modalStore[0]}
  <div class="modal-example-form {cBase}">
    <header class="{cHeader}">
      {$modalStore[0].title ?? "(title missing)"}
    </header>
    <article>{$modalStore[0].body ?? "(body missing)"}</article>
    <form class="modal-form {cForm}">
      <input type="hidden" name="endpoint" value="{endpoint}" />
      <!-- svelte-ignore a11y-label-has-associated-control -->
      <label class="label">
        <span>Contraseña actual</span>
        <PasswordInput
          value="{$formData.clave}"
          onInput="{(e) =>
            formData.update((fd) => ({ ...fd, clave: e.target.value }))}"
          name="current_password"
        />
      </label>
      <!-- svelte-ignore a11y-label-has-associated-control -->
      <label class="label">
        <span>Nueva clave</span>
        <PasswordInput
          value="{$formData.nueva_clave}"
          onInput="{(e) => {
            const target = e.target;
            formData.update((fd) => ({ ...fd, nueva_clave: target.value }));
            validatePassword(target.value);
            validateConfirmPassword(
              target.value,
              get(formData).confirmar_clave
            );
          }}"
          name="new_password"
        />
      </label>
      <ul class="validations">
        <li class="{$validations.length ? 'valid' : 'invalid'}">
          Debe tener entre 8 y 16 caracteres
        </li>
        <li class="{$validations.lowercase ? 'valid' : 'invalid'}">
          Debe tener al menos una minúscula
        </li>
        <li class="{$validations.uppercase ? 'valid' : 'invalid'}">
          Debe tener al menos una mayúscula
        </li>
        <li class="{$validations.number ? 'valid' : 'invalid'}">
          Debe tener al menos un número
        </li>
        <li class="{$validations.specialChar ? 'valid' : 'invalid'}">
          Debe tener al menos un carácter especial
        </li>
      </ul>
      <!-- svelte-ignore a11y-label-has-associated-control -->
      <label class="label">
        <span>Confirma tu nueva clave</span>
        <PasswordInput
          value="{$formData.confirmar_clave}"
          onInput="{(e) => {
            const target = e.target;
            formData.update((fd) => ({ ...fd, confirmar_clave: target.value }));
            validateConfirmPassword(get(formData).nueva_clave, target.value);
          }}"
          name="confirmar_clave"
        />
      </label>
      <ul class="validations">
        <li class="{$validations.match ? 'valid' : 'invalid'}">
          Las contraseñas no coinciden
        </li>
      </ul>
    </form>
    <footer class="modal-footer {parent.regionFooter}">
      <button class="btn {parent.buttonNeutral}" on:click="{parent.onClose}"
        >{parent.buttonTextCancel}</button
      >
      <button
        class="btn {parent.buttonPositive}"
        disabled="{!$isFormValid}"
        type="button"
        on:click="{() => {
          if ($isFormValid) {
            $modalStore[0].response($formData);
          } else {
            triggerToast('error', 'Por favor, revisa los campos');
          }
        }}"
      >
        {parent.buttonTextSubmit}</button
      >
    </footer>
  </div>
{/if}

<style>
  .valid {
    display: none;
  }
  .invalid {
    color: red;
  }
</style>
