export function setupSidebarEvents() {
    $('.expand-button').on('click', (event) => {
        console.log('sidebar events');
        $('.sidebar-mobile').removeClass('sidebar-mobile').addClass('sidebar-mobile-expand');
        $('.expand-button').hide();
        $('.dimmer').show();
    });

    $('.dimmer').on('click', () => {
        $('.sidebar-mobile-expand').removeClass('sidebar-mobile-expand').addClass('sidebar-mobile');
        $('.expand-button').show();
        $('.dimmer').hide();
    });
}