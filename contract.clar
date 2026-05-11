;; emoji-react -- on-chain emoji reactions (10 emoji slots)
;; Clarity 4

(define-data-var total-reactions uint u0)
(define-map emoji-tally uint uint)
(define-map user-reactions principal uint)

(define-public (react (emoji uint))
  (begin
    (asserts! (and (>= emoji u1) (<= emoji u10)) (err u100))
    (let ((cur (default-to u0 (map-get? emoji-tally emoji)))
          (mine (default-to u0 (map-get? user-reactions tx-sender))))
      (map-set emoji-tally emoji (+ cur u1))
      (map-set user-reactions tx-sender (+ mine u1))
      (var-set total-reactions (+ (var-get total-reactions) u1))
      (print { event: "react", emoji: emoji, user: tx-sender })
      (ok (+ cur u1)))))

(define-read-only (get-emoji-count (emoji uint))
  (default-to u0 (map-get? emoji-tally emoji)))

(define-read-only (get-user-count (user principal))
  (default-to u0 (map-get? user-reactions user)))

(define-read-only (total)
  (var-get total-reactions))
