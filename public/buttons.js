let is_collapsed = false
let is_add_hidden = false

let toggles = document.getElementsByClassName('toggle')
let add_buttons = document.getElementsByClassName('add-button')

for (let ix = 0; ix < toggles.length; ix++) {
    toggles[ix].onclick = (e) => {
        e.target.parentElement.classList.toggle('hidden')
    }
}

let toggleCollapse = () => {
    for (let ix = 0; ix < toggles.length; ix++) {
        if (is_collapsed) {
            toggles[ix].parentElement.classList.remove('hidden')
        } else {
            toggles[ix].parentElement.classList.add('hidden')
        }
    }
    is_collapsed = !is_collapsed
    document.getElementById('collapse-btn').innerText = (is_collapsed ? 'Expand' : 'Collapse')
    console.log('is_collapsed', is_collapsed)
}

let toggleAddButtons = (hide = false) => {
    for (let ix = 0; ix < add_buttons.length; ix++) {
        if (is_add_hidden) {
            add_buttons[ix].classList.remove('hidden-self')
        } else {
            add_buttons[ix].classList.add('hidden-self')
        }
    }
    is_add_hidden = !is_add_hidden
    document.getElementById('hide-add-btn').innerText = (is_add_hidden ? 'Show Add(s)' : 'Hide Add(s)')
}

let reload = () => window.location = '/reload'

toggleCollapse()
toggleAddButtons()