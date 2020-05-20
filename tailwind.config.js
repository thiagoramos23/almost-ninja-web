module.exports = {
    theme: {
        fontFamily: {
            body: ['Lato', 'sans-serif'],
            display: ['Lato', 'sans-serif'],
        },
        aspectRatio: { // defaults to {}
            'none': 0,
            'square': [1, 1], // or 1 / 1, or simply 1
            '16/9': [16, 9], // or 16 / 9
            '4/3': [4, 3], // or 4 / 3
            '21/9': [21, 9], // or 21 / 9
        },
        extend: {
            spacing: {
                '96': '24rem',
                '128': '32rem',
                '160': '40rem',
                '192': '48rem',
            }
        },
    },
    variants: {
        aspectRatio: ['responsive'], // defaults to ['responsive']
    },
    plugins: [
        require('tailwindcss-aspect-ratio'),
    ],
}