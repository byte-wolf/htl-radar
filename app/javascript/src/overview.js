
export function setupButtonEvents() {
    console.log('Setup Events')

    $('.day-fill').on('click', (event) => {
        $.ajax('/occurrences_compact?day=' + event.target.id)
            .done((data) => {
                $('#events-modal').html(data);
            })
    })
}