<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>CineNexus — Book Movie Tickets</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

    <style>
        /* ========== ROOT VARIABLES ========== */
        :root {
            --bg: #f5f3f0;
            --bg-card: #ffffff;
            --primary: #1a1a2e;
            --primary-light: #2d2d44;
            --accent: #e07a5f;
            --accent-light: #f4d0c4;
            --accent-dark: #c05a3e;
            --muted: #6b6b7a;
            --muted-light: #a0a0b0;
            --surface: #f0efed;
            --success: #2a9d8f;
            --warning: #e9c46a;
            --danger: #e63946;
            --radius: 16px;
            --radius-sm: 10px;
            --shadow: 0 4px 24px rgba(26, 26, 46, 0.06);
            --shadow-hover: 0 12px 48px rgba(26, 26, 46, 0.10);
            --transition: 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            --container: 1200px;
        }

        /* ========== RESET & BASE ========== */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        html {
            scroll-behavior: smooth;
        }
        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            background: var(--bg);
            color: var(--primary);
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            min-height: 100vh;
        }
        a {
            color: inherit;
            text-decoration: none;
        }
        img {
            display: block;
            max-width: 100%;
        }
        button {
            cursor: pointer;
            font-family: inherit;
            border: none;
            background: none;
            color: inherit;
        }
        input, select {
            font-family: inherit;
        }

        .container {
            width: 100%;
            max-width: var(--container);
            margin: 0 auto;
            padding: 0 20px;
        }

        /* ========== UTILITIES ========== */
        .sr-only {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0;
        }

        /* ========== BUTTONS ========== */
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 28px;
            border-radius: 999px;
            font-weight: 600;
            font-size: 15px;
            transition: var(--transition);
            border: 2px solid transparent;
            white-space: nowrap;
        }
        .btn-primary {
            background: var(--accent);
            color: #fff;
            border-color: var(--accent);
        }
        .btn-primary:hover {
            background: var(--accent-dark);
            border-color: var(--accent-dark);
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(224, 122, 95, 0.30);
        }
        .btn-secondary {
            background: var(--primary);
            color: #fff;
            border-color: var(--primary);
        }
        .btn-secondary:hover {
            background: var(--primary-light);
            border-color: var(--primary-light);
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(26, 26, 46, 0.20);
        }
        .btn-outline {
            background: transparent;
            color: var(--primary);
            border-color: rgba(26, 26, 46, 0.15);
        }
        .btn-outline:hover {
            background: var(--primary);
            color: #fff;
            border-color: var(--primary);
            transform: translateY(-2px);
        }
        .btn-success {
            background: var(--success);
            color: #fff;
            border-color: var(--success);
        }
        .btn-success:hover {
            background: #21867a;
            border-color: #21867a;
            transform: translateY(-2px);
        }
        .btn-sm {
            padding: 8px 18px;
            font-size: 13px;
        }
        .btn-block {
            width: 100%;
            justify-content: center;
        }

        /* ========== HEADER ========== */
        header {
            position: sticky;
            top: 0;
            z-index: 100;
            background: rgba(255, 255, 255, 0.92);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-bottom: 1px solid rgba(26, 26, 46, 0.04);
        }
        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            padding: 12px 0;
            min-height: 68px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 800;
            font-size: 22px;
            letter-spacing: -0.5px;
            color: var(--primary);
            flex-shrink: 0;
        }
        .brand .accent {
            color: var(--accent);
        }
        .brand i {
            font-size: 26px;
            color: var(--accent);
        }

        nav.main-nav ul {
            display: flex;
            gap: 4px;
            list-style: none;
            align-items: center;
        }
        nav.main-nav li a {
            display: flex;
            align-items: center;
            gap: 6px;
            padding: 8px 16px;
            border-radius: var(--radius-sm);
            font-weight: 500;
            font-size: 14px;
            color: var(--muted);
            transition: var(--transition);
        }
        nav.main-nav li a:hover,
        nav.main-nav li a.active {
            background: var(--surface);
            color: var(--primary);
        }
        nav.main-nav li a i {
            font-size: 14px;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 6px;
            flex-shrink: 0;
        }
        .header-actions .icon-btn {
            width: 42px;
            height: 42px;
            display: grid;
            place-items: center;
            border-radius: 50%;
            font-size: 18px;
            color: var(--muted);
            transition: var(--transition);
            position: relative;
        }
        .header-actions .icon-btn:hover {
            background: var(--surface);
            color: var(--primary);
        }

        .mobile-toggle {
            display: none;
            width: 42px;
            height: 42px;
            border-radius: 50%;
            font-size: 20px;
            background: var(--surface);
            color: var(--primary);
            transition: var(--transition);
        }
        .mobile-toggle:hover {
            background: var(--accent-light);
        }

        #mobileMenu {
            display: none;
            background: #fff;
            border-top: 1px solid rgba(26, 26, 46, 0.04);
            padding: 12px 0 20px;
        }
        #mobileMenu ul {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }
        #mobileMenu ul li a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 16px;
            border-radius: var(--radius-sm);
            font-weight: 500;
            color: var(--primary);
            transition: var(--transition);
        }
        #mobileMenu ul li a:hover {
            background: var(--surface);
        }
        #mobileMenu ul li a i {
            width: 22px;
            color: var(--muted);
        }

        /* ========== HERO ========== */
        .hero {
            position: relative;
            display: flex;
            align-items: center;
            min-height: 380px;
            padding: 48px 0;
            border-radius: var(--radius);
            overflow: hidden;
            margin: 20px 20px 0;
            background: linear-gradient(135deg, #1a1a2e 0%, #2d2d44 100%);
        }
        .hero::before {
            content: '';
            position: absolute;
            inset: 0;
            background: url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?auto=format&fit=crop&w=1400&q=80') center/cover no-repeat;
            opacity: 0.30;
            z-index: 0;
        }
        .hero .container {
            position: relative;
            z-index: 1;
        }
        .hero .badge {
            display: inline-block;
            background: rgba(224, 122, 95, 0.25);
            color: #ffd4c4;
            padding: 4px 16px;
            border-radius: 999px;
            font-weight: 600;
            font-size: 13px;
            letter-spacing: 0.3px;
            margin-bottom: 16px;
        }
        .hero h1 {
            font-family: 'Playfair Display', serif;
            font-size: 46px;
            font-weight: 700;
            color: #fff;
            line-height: 1.15;
            max-width: 600px;
            margin-bottom: 16px;
        }
        .hero p {
            color: rgba(255, 255, 255, 0.80);
            font-size: 17px;
            max-width: 520px;
            margin-bottom: 28px;
            line-height: 1.6;
        }
        .hero .actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        /* ========== SECTION ========== */
        .section {
            padding: 48px 0;
        }
        .section-header {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            gap: 16px;
            margin-bottom: 28px;
            flex-wrap: wrap;
        }
        .section-header .title-group h2 {
            font-size: 26px;
            font-weight: 700;
            letter-spacing: -0.3px;
        }
        .section-header .title-group p {
            color: var(--muted);
            margin-top: 4px;
            font-size: 15px;
        }

        /* ========== MOVIE CARDS ========== */
        .movies-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }
        .movie-card {
            background: var(--bg-card);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: var(--transition);
            display: flex;
            flex-direction: column;
            border: 2px solid transparent;
            cursor: pointer;
        }
        .movie-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-hover);
            border-color: var(--accent-light);
        }
        .movie-card .poster-wrap {
            position: relative;
            overflow: hidden;
            background: var(--surface);
            aspect-ratio: 2 / 3;
        }
        .movie-card .poster-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition);
        }
        .movie-card:hover .poster-wrap img {
            transform: scale(1.04);
        }
        .movie-card .rating-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: rgba(0, 0, 0, 0.75);
            color: #fff;
            padding: 4px 10px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 4px;
            backdrop-filter: blur(4px);
        }
        .movie-card .rating-badge i {
            color: #f5a623;
            font-size: 11px;
        }
        .movie-card .genre-tag {
            position: absolute;
            bottom: 12px;
            left: 12px;
            background: rgba(224, 122, 95, 0.90);
            color: #fff;
            padding: 3px 10px;
            border-radius: 999px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.3px;
        }
        .movie-card .body {
            padding: 16px 18px 14px;
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }
        .movie-card .body h5 {
            font-size: 16px;
            font-weight: 700;
            line-height: 1.3;
        }
        .movie-card .body .meta {
            font-size: 13px;
            color: var(--muted);
        }
        .movie-card .body .price-row {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 6px;
        }
        .movie-card .body .price {
            font-weight: 700;
            font-size: 17px;
            color: var(--accent);
        }
        .movie-card .body .price small {
            font-weight: 400;
            font-size: 12px;
            color: var(--muted);
        }
        .movie-card .footer {
            padding: 0 18px 18px;
        }
        .movie-card .footer .book-btn {
            width: 100%;
            padding: 10px;
            border-radius: var(--radius-sm);
            background: var(--primary);
            color: #fff;
            font-weight: 600;
            font-size: 14px;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        .movie-card .footer .book-btn:hover {
            background: var(--accent);
            transform: scale(1.02);
        }

        /* ========== BOOKING PANEL ========== */
        .booking-panel {
            background: var(--bg-card);
            border-radius: var(--radius);
            box-shadow: var(--shadow-hover);
            padding: 32px;
            display: none;
            margin-top: 24px;
            border: 2px solid var(--accent-light);
        }
        .booking-panel.active {
            display: block;
            animation: slideDown 0.3s ease;
        }
        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-12px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .booking-panel h3 {
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 4px;
        }
        .booking-panel .sub {
            color: var(--muted);
            font-size: 14px;
            margin-bottom: 24px;
        }
        .booking-layout {
            display: grid;
            grid-template-columns: 1fr 320px;
            gap: 32px;
        }
        .booking-info h4 {
            font-size: 15px;
            font-weight: 700;
            margin-bottom: 12px;
            color: var(--primary);
        }
        .booking-info h4 i {
            color: var(--accent);
            margin-right: 6px;
        }
        .time-slots {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }
        .time-slot {
            padding: 10px 20px;
            border-radius: var(--radius-sm);
            border: 2px solid rgba(26, 26, 46, 0.10);
            background: var(--bg);
            font-weight: 600;
            font-size: 14px;
            transition: var(--transition);
            text-align: center;
        }
        .time-slot:hover {
            border-color: var(--accent);
        }
        .time-slot.selected {
            background: var(--accent);
            color: #fff;
            border-color: var(--accent);
        }
        .time-slot small {
            display: block;
            font-weight: 400;
            font-size: 11px;
            opacity: 0.7;
        }

        .screen {
            background: linear-gradient(to bottom, var(--primary), var(--primary-light));
            height: 8px;
            border-radius: 4px 4px 50% 50%;
            margin: 16px 0 24px;
            position: relative;
        }
        .screen::after {
            content: 'SCREEN';
            position: absolute;
            bottom: -20px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 10px;
            letter-spacing: 2px;
            color: var(--muted-light);
            font-weight: 600;
        }

        .seats-grid {
            display: grid;
            grid-template-columns: repeat(8, 1fr);
            gap: 8px;
            margin: 28px 0 20px;
            max-width: 420px;
        }
        .seat {
            aspect-ratio: 1;
            border-radius: 6px;
            background: var(--surface);
            border: 2px solid transparent;
            display: grid;
            place-items: center;
            font-size: 10px;
            font-weight: 600;
            color: var(--muted-light);
            transition: var(--transition);
            cursor: pointer;
        }
        .seat:hover:not(.taken) {
            background: var(--accent-light);
            border-color: var(--accent);
        }
        .seat.selected {
            background: var(--accent);
            color: #fff;
            border-color: var(--accent-dark);
            transform: scale(1.08);
        }
        .seat.taken {
            background: #e8e8e8;
            color: #c0c0c0;
            cursor: not-allowed;
            opacity: 0.6;
        }
        .seat-legend {
            display: flex;
            gap: 20px;
            font-size: 13px;
            color: var(--muted);
            flex-wrap: wrap;
        }
        .seat-legend span {
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .seat-legend .dot {
            width: 16px;
            height: 16px;
            border-radius: 4px;
            display: inline-block;
        }
        .dot.available { background: var(--surface); border: 2px solid var(--border, #e0e0e0); }
        .dot.selected { background: var(--accent); }
        .dot.taken { background: #e8e8e8; opacity: 0.6; }

        .booking-summary {
            background: var(--bg);
            border-radius: var(--radius-sm);
            padding: 24px;
            position: sticky;
            top: 100px;
            align-self: start;
        }
        .booking-summary h4 {
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 16px;
            padding-bottom: 12px;
            border-bottom: 1px solid rgba(26, 26, 46, 0.06);
        }
        .summary-line {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            font-size: 14px;
            color: var(--muted);
        }
        .summary-line span:last-child {
            font-weight: 600;
            color: var(--primary);
        }
        .summary-total {
            display: flex;
            justify-content: space-between;
            padding: 16px 0 0;
            margin-top: 8px;
            border-top: 2px solid rgba(26, 26, 46, 0.06);
            font-size: 18px;
            font-weight: 700;
        }
        .summary-total span:last-child {
            color: var(--accent);
        }
        .booking-summary .btn {
            margin-top: 20px;
        }
        .booking-summary .note {
            font-size: 12px;
            color: var(--muted-light);
            text-align: center;
            margin-top: 12px;
        }

        .selected-seats-display {
            font-size: 13px;
            color: var(--muted);
            min-height: 20px;
            margin-bottom: 8px;
        }
        .selected-seats-display strong {
            color: var(--primary);
        }

        /* ========== SUCCESS MODAL ========== */
        .modal-overlay {
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(4px);
            z-index: 200;
            display: none;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .modal-overlay.active {
            display: flex;
            animation: fadeIn 0.2s ease;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .modal {
            background: #fff;
            border-radius: var(--radius);
            padding: 40px;
            text-align: center;
            max-width: 420px;
            width: 100%;
            box-shadow: var(--shadow-hover);
            animation: popIn 0.3s ease;
        }
        @keyframes popIn {
            from { transform: scale(0.9); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }
        .modal .icon-circle {
            width: 72px;
            height: 72px;
            border-radius: 50%;
            background: rgba(42, 157, 143, 0.12);
            color: var(--success);
            display: grid;
            place-items: center;
            font-size: 32px;
            margin: 0 auto 20px;
        }
        .modal h3 {
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 8px;
        }
        .modal p {
            color: var(--muted);
            font-size: 15px;
            margin-bottom: 8px;
        }
        .modal .details {
            background: var(--bg);
            border-radius: var(--radius-sm);
            padding: 16px;
            margin: 16px 0 24px;
            text-align: left;
            font-size: 14px;
        }
        .modal .details div {
            display: flex;
            justify-content: space-between;
            padding: 4px 0;
        }
        .modal .details div span:first-child {
            color: var(--muted);
        }
        .modal .details div span:last-child {
            font-weight: 600;
        }

        /* ========== TOAST ========== */
        .toast {
            position: fixed;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%) translateY(100px);
            background: var(--primary);
            color: #fff;
            padding: 14px 28px;
            border-radius: 999px;
            font-size: 14px;
            font-weight: 600;
            box-shadow: var(--shadow-hover);
            z-index: 300;
            opacity: 0;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .toast.show {
            transform: translateX(-50%) translateY(0);
            opacity: 1;
        }
        .toast i {
            color: var(--success);
        }

        /* ========== FOOTER ========== */
        footer {
            margin-top: 16px;
            padding: 44px 0 28px;
            border-top: 1px solid rgba(26, 26, 46, 0.04);
        }
        .footer-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 40px;
            margin-bottom: 32px;
        }
        .footer-grid .brand-col .brand {
            font-size: 20px;
            margin-bottom: 8px;
        }
        .footer-grid .brand-col p {
            color: var(--muted);
            font-size: 14px;
            max-width: 300px;
            line-height: 1.6;
        }
        .footer-grid .brand-col .socials {
            display: flex;
            gap: 10px;
            margin-top: 14px;
        }
        .footer-grid .brand-col .socials a {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--surface);
            display: grid;
            place-items: center;
            color: var(--muted);
            transition: var(--transition);
            font-size: 16px;
        }
        .footer-grid .brand-col .socials a:hover {
            background: var(--accent);
            color: #fff;
        }
        .footer-grid .col h5 {
            font-weight: 700;
            font-size: 14px;
            margin-bottom: 12px;
            color: var(--primary);
        }
        .footer-grid .col ul {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }
        .footer-grid .col ul li a {
            color: var(--muted);
            font-size: 14px;
            transition: var(--transition);
        }
        .footer-grid .col ul li a:hover {
            color: var(--accent);
        }
        .footer-bottom {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid rgba(26, 26, 46, 0.04);
            color: var(--muted-light);
            font-size: 13px;
        }

        /* ========== RESPONSIVE ========== */
        @media (max-width: 1100px) {
            .movies-grid { grid-template-columns: repeat(3, 1fr); }
            .booking-layout { grid-template-columns: 1fr; }
            .booking-summary { position: static; }
        }
        @media (max-width: 900px) {
            .hero h1 { font-size: 34px; }
            .hero { min-height: 320px; margin: 16px 16px 0; padding: 36px 0; }
            .footer-grid { grid-template-columns: 1fr 1fr; gap: 28px; }
            .seats-grid { grid-template-columns: repeat(6, 1fr); }
        }
        @media (max-width: 768px) {
            nav.main-nav { display: none; }
            .mobile-toggle { display: grid; place-items: center; }
            .movies-grid { grid-template-columns: repeat(2, 1fr); gap: 14px; }
            .hero h1 { font-size: 28px; }
            .hero p { font-size: 15px; }
            .section-header h2 { font-size: 22px; }
            .booking-panel { padding: 20px; }
            .seats-grid { grid-template-columns: repeat(6, 1fr); gap: 6px; max-width: 100%; }
            .footer-grid { grid-template-columns: 1fr; gap: 20px; }
            .brand { font-size: 18px; }
            .brand i { font-size: 20px; }
            .header-actions .icon-btn { width: 36px; height: 36px; font-size: 15px; }
            .section { padding: 32px 0; }
        }
        @media (max-width: 480px) {
            .container { padding: 0 14px; }
            .movies-grid { grid-template-columns: 1fr 1fr; gap: 10px; }
            .hero { margin: 10px 10px 0; min-height: 260px; padding: 24px 0; border-radius: var(--radius-sm); }
            .hero h1 { font-size: 22px; }
            .hero .actions .btn { padding: 10px 18px; font-size: 13px; }
            .movie-card .body { padding: 12px 12px 8px; }
            .movie-card .body h5 { font-size: 13px; }
            .movie-card .footer { padding: 0 12px 12px; }
            .movie-card .footer .book-btn { font-size: 12px; padding: 8px; }
            .seats-grid { grid-template-columns: repeat(6, 1fr); gap: 5px; }
            .seat { font-size: 9px; }
            .booking-panel { padding: 16px; }
            .time-slot { padding: 8px 14px; font-size: 13px; }
            .modal { padding: 28px 20px; }
        }
    </style>
</head>

<body>

    <!-- ===== HEADER ===== -->
    <header>
        <div class="container header-inner">
            <div style="display:flex;align-items:center;gap:12px;">
                <button class="mobile-toggle" id="mobileToggle" aria-label="Toggle menu">
                    <i class="fas fa-bars"></i>
                </button>
                <a class="brand" href="#">
                    <i class="fas fa-film"></i>
                    <span>Cine<span class="accent">Nexus</span></span>
                </a>
            </div>

            <nav class="main-nav" aria-label="Main navigation">
                <ul>
                    <li><a href="#" class="active"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="#nowShowing"><i class="fas fa-fire"></i> Now Showing</a></li>
                    <li><a href="#comingSoon"><i class="fas fa-clock"></i> Coming Soon</a></li>
                    <li><a href="#"><i class="fas fa-ticket-alt"></i> My Tickets</a></li>
                </ul>
            </nav>

            <div class="header-actions">
                <button class="icon-btn" title="Search" aria-label="Search"><i class="fas fa-search"></i></button>
                <button class="icon-btn" title="Account" aria-label="Account"><i class="far fa-user"></i></button>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div id="mobileMenu">
            <div class="container">
                <ul>
                    <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="#nowShowing"><i class="fas fa-fire"></i> Now Showing</a></li>
                    <li><a href="#comingSoon"><i class="fas fa-clock"></i> Coming Soon</a></li>
                    <li><a href="#"><i class="fas fa-ticket-alt"></i> My Tickets</a></li>
                    <li><a href="#"><i class="far fa-user"></i> Account</a></li>
                </ul>
            </div>
        </div>
    </header>

    <!-- ===== MAIN ===== -->
    <main>

        <!-- HERO -->
        <section class="hero" aria-label="Hero banner">
            <div class="container">
                <div class="badge"><i class="fas fa-star"></i> Now Booking</div>
                <h1>Book Your Movie<br>Tickets in Seconds</h1>
                <p>Choose a movie, pick your seats, and enjoy the show. It's that simple.</p>
                <div class="actions">
                    <button class="btn btn-primary" onclick="document.getElementById('nowShowing').scrollIntoView({behavior:'smooth'})">
                        <i class="fas fa-ticket-alt"></i> Book Now
                    </button>
                    <button class="btn btn-outline" style="color:#fff;border-color:rgba(255,255,255,0.3)"
                            onclick="document.getElementById('comingSoon').scrollIntoView({behavior:'smooth'})">
                        <i class="fas fa-clock"></i> Coming Soon
                    </button>
                </div>
            </div>
        </section>

        <!-- NOW SHOWING -->
        <section class="section" id="nowShowing" aria-labelledby="now-title">
            <div class="container">
                <div class="section-header">
                    <div class="title-group">
                        <h2 id="now-title">🎬 Now Showing</h2>
                        <p>Pick a movie and book your seats instantly</p>
                    </div>
                </div>
                <div class="movies-grid" id="moviesGrid" aria-live="polite"></div>

                <!-- Booking Panel -->
                <div class="booking-panel" id="bookingPanel">
                    <h3 id="bookingMovieTitle">Select a movie</h3>
                    <p class="sub" id="bookingMovieMeta"></p>

                    <div class="booking-layout">
                        <div class="booking-info">
                            <h4><i class="fas fa-clock"></i> Showtime</h4>
                            <div class="time-slots" id="timeSlots"></div>

                            <h4><i class="fas fa-couch"></i> Pick Your Seats</h4>
                            <div class="screen"></div>
                            <div class="seats-grid" id="seatsGrid"></div>

                            <div class="seat-legend">
                                <span><span class="dot available"></span> Available</span>
                                <span><span class="dot selected"></span> Selected</span>
                                <span><span class="dot taken"></span> Taken</span>
                            </div>
                        </div>

                        <div class="booking-summary">
                            <h4>Order Summary</h4>
                            <div class="summary-line"><span>Movie</span><span id="sumMovie">—</span></div>
                            <div class="summary-line"><span>Showtime</span><span id="sumTime">—</span></div>
                            <div class="summary-line"><span>Seats</span><span id="sumSeats">—</span></div>
                            <div class="selected-seats-display" id="selectedSeatsDisplay"></div>
                            <div class="summary-total">
                                <span>Total</span>
                                <span
