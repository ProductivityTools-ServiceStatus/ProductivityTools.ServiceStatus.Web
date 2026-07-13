
const dev = {
    configUrls : 'https://script.google.com/macros/s/AKfycbyMXkh3v12rqFIkeDG3dzK6WRta9TKilVJ3IOUqt-1599PnwrP5KP_-wPUyOXDbW44Z/exec'
}


const prod = {
    configUrls : 'https://script.google.com/macros/s/AKfycbyMXkh3v12rqFIkeDG3dzK6WRta9TKilVJ3IOUqt-1599PnwrP5KP_-wPUyOXDbW44Z/exec'
}

export const config = process.env.NODE_ENV === 'development' ? dev : prod;