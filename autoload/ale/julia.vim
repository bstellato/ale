" Set just so tests can override it.
let g:__ale_julia_project_filenames = ['.git/HEAD']
function! ale#julia#FindProjectRoot(buffer) abort
    for l:project_filename in g:__ale_julia_project_filenames
        let l:full_path = ale#path#FindNearestFile(a:buffer, l:project_filename)

        if !empty(l:full_path)
            let l:path = fnamemodify(l:full_path, ':h')

            " Correct .git path detection.
            if fnamemodify(l:path, ':t') is# '.git'
                let l:path = fnamemodify(l:path, ':h')
            endif

            return l:path
        endif
    endfor

    return ''
endfunction

