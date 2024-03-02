import { Application } from "@hotwired/stimulus"
import { Autocomplete } from 'stimulus-autocomplete'

const application = Application.start()
application.register('autocomplete', Autocomplete)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }



//import { Application } from "@hotwired/stimulus"

//const application = Application.start()

//// Configure Stimulus development experience
//application.debug = false
//window.Stimulus   = application

//export { application }
