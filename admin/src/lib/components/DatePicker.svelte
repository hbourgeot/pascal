<script lang="ts">
  import Flatpickr from 'svelte-flatpickr';
  import 'flatpickr/dist/flatpickr.css';
  import { createEventDispatcher } from 'svelte';
  import type { BaseOptions } from 'flatpickr/dist/types/options';
  export let value: Date | Date[] | null = null;
  export let dateRange: boolean = false;
  export let timePicker: boolean = false;
  export let options: Partial<BaseOptions> = {};
    const dispatch = createEventDispatcher();

    let mergedOptions: Partial<BaseOptions> = {};

  $: mergedOptions = {
    mode: dateRange ? 'range' : 'single',
    enableTime: timePicker || options.enableTime,
    noCalendar: timePicker,
    dateFormat: timePicker ? 'H:i' : 'd/m/Y',
    time_24hr: false,
    allowInput: false,
    
     locale: {
      firstDayOfWeek: 1,
      rangeSeparator: ' al ',

     },
    ...options
  };

  const onChange = () => {
    dispatch('change', value);
  }
</script>

<div class="form-control w-full">
  <Flatpickr
    bind:value
    options={mergedOptions}
    class="input input-bordered w-full py-1 px-4"
    on:change="{onChange}"
  />
</div>
