if has("gui_macvim")
    " Command-Return for fullscreen
    macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

    " Start w/o the toolbar
    set guioptions-=T
endif
