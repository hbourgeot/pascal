<script>
  import Logo from "$lib/images/logo.jpg";

  import { AppBar } from "@skeletonlabs/skeleton";
  import { TreeView, TreeViewItem } from "@skeletonlabs/skeleton";
</script>

<AppBar
  gridColumns="grid-cols-2"
  slotDefault="place-self-start"
  slotTrail="place-content-end"
  background="bg-white"
  padding="py-4"
  style="border-bottom: 1px solid rgb(229 231 235);"
>
  <svelte:fragment slot="lead" />

  <a href="/" class="w-full mx-3">
    <img src={Logo} class="inline-block w-12 h-12 md:w-15 md:h-15" alt="logo" />
  </a>

  <svelte:fragment slot="trail">
    <div class="block relative mr-4">
      <TreeView>
        <TreeViewItem>
          Iniciar Sesión

          <svelte:fragment slot="children">
            <div class="absolute bg-white z-10 mt-4 w-full rounded-sm p-2">
              <TreeViewItem regionSymbol="hidden">
                <span class="w-full text-center">
                  <a href="/estudiantes/login">Estudiantes</a>
                </span>
              </TreeViewItem>
              <TreeViewItem regionSymbol="hidden">
                <span class="w-full text-center">
                  <a href="/docentes/login">Docentes</a>
                </span>
              </TreeViewItem>
            </div>
          </svelte:fragment>
        </TreeViewItem>
      </TreeView>
    </div>
  </svelte:fragment>
</AppBar>
