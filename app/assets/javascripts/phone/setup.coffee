window.F7H =
    app: new framework7()
    dom: Framework7.$

windw.Phone =
    Views: {}

Phone.Views.Main =
    F7H.app.addView '.view-main',
        dynamicNavbar: true
