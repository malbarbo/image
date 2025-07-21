export function cos_deg(angle) {
    return Math.cos(angle * Math.PI / 180.0)
}

export function sin_deg(angle) {
    return Math.sin(angle * Math.PI / 180.0)
}

export function hypot(a, b) {
    return Math.hypot(a, b)
}

let clipid = 0

export function clip_id() {
    globalThis
    return clipid++;
}