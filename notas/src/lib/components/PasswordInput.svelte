<script lang="ts">
  import { Visibility, VisibilityOff } from '@steeze-ui/material-design-icons';
  import { Icon } from '@steeze-ui/svelte-icon';
import { writable } from 'svelte/store';

  export let value: string;
  export let onInput: (event: Event) => void;

  const visibility = writable(false);

  const toggleVisibility = () => {
    visibility.update(v => !v);
  };
</script>

<div class="input-group">
  <input
    class="input p-2"
    type={$visibility ? "text" : "password"}
    value={value}
    on:input={onInput}
    {...$$restProps}
  />
  <button type="button" on:click={toggleVisibility}>
    <Icon src={$visibility ? VisibilityOff : Visibility} class="w-6 h-6" />
  </button>
</div>

<style>
  .input-group {
    display: flex;
    align-items: center;
  }
  .input-group button {
    margin-left: 8px;
    padding: 4px 8px;
    background: none;
    border: 1px solid #ccc;
    cursor: pointer;
  }
</style>
