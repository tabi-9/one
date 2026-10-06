<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>CineNexus — Book Movie Tickets</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root{
  --bg:#f5f3f0; --bg-card:#fff; --primary:#1a1a2e; --primary-light:#2d2d44;
  --accent:#e07a5f; --accent-light:#f4d0c4; --accent-dark:#c05a3e;
  --muted:#6b6b7a; --muted-light:#a0a0b0; --surface:#f0efed;
  --success:#2a9d8f; --warning:#e9c46a; --danger:#e63946;
  --radius:16px; --radius-sm:10px;
  --shadow:0 4px 24px rgba(26,26,46,.06); --shadow-hover:0 12px 48px rgba(26,26,46,.10);
  --transition:.25s cubic-bezier(.4,0,.2,1);
}
*{box-sizing:border-box;margin:0;padding:0}
html{scroll-behavior:smooth}
body{font-family:'Inter',system-ui,sans-serif;background:var(--bg);color:var(--primary);line-height:1.5;-webkit-font-smoothing:antialiased}
a{color:inherit;text-decoration:none}
img{display:block;max-width:100%}
button{cursor:pointer;font-family:inherit;border:none;background:none;color:inherit}
.container{width:100%;max-width:1200px;margin:0 auto;padding:0 20px}

/* Buttons */
.btn{display:inline-flex;align-items:center;justify-content:center;gap:8px;padding:12px 28px;border-radius:999px;font-weight:600;font-size:15px;transition:var(--transition);border:2px solid transparent;white-space:nowrap}
.btn-primary{background:var(--accent);color:#fff;border-color:var(--accent)}
.btn-primary:hover{background:var(--accent-dark);border-color:var(--accent-dark);transform:translateY(-2px);box-shadow:0 8px 24px rgba(224,122,95,.3)}
.btn-success{background:var(--success);color:#fff;border-color:var(--success)}
.btn-success:hover{background:#21867a;border-color:#21867a;transform:translateY(-2px)}
.btn-outline{background:transparent;color:#fff;border-color:rgba(255,255,255,.35)}
.btn-outline:hover{background:rgba(255,255,255,.12);border-color:#fff}
.btn-block{width:100%;justify-content:center}
.btn:disabled{opacity:.5;cursor:not-allowed;transform:none!important;box-shadow:none!important}

/* Header */
header{position:sticky;top:0;z-index:100;background:rgba(255,255,255,.92);backdrop-filter:blur(16px);border-bottom:1px solid rgba(26,26,46,.04)}
.header-inner{display:flex;align-items:center;justify-content:space-between;gap:16px;padding:12px 0;min-height:68px}
.brand{display:flex;align-items:center;gap:10px;font-weight:800;font-size:22px;letter-spacing:-.5px}
.brand i{font-size:26px;color:var(--accent)}
.brand .accent{color:var(--accent)}
nav ul{display:flex;gap:4px;list-style:none}
nav a{display:flex;align-items:center;gap:6px;padding:8px 16px;border-radius:var(--radius-sm);font-weight:500;font-size:14px;color:var(--muted);transition:var(--transition)}
nav a:hover,nav a.active{background:var(--surface);color:var(--primary)}
.header-actions{display:flex;gap:6px}
.icon-btn{width:42px;height:42px;display:grid;place-items:center;border-radius:50%;font-size:18px;color:var(--muted);transition:var(--transition)}
.icon-btn:hover{background:var(--surface);color:var(--primary)}
.mobile-toggle{display:none;width:42px;height:42px;border-radius:50%;font-size:20px;background:var(--surface)}
#mobileMenu{display:none;background:#fff;border-top:1px solid rgba(26,26,46,.04);padding:12px 0 20px}
#mobileMenu ul{list-style:none;display:flex;flex-direction:column;gap:4px}
#mobileMenu a{display:flex;align-items:center;gap:12px;padding:12px 16px;border-radius:var(--radius-sm);font-weight:500}
#mobileMenu a:hover{background:var(--surface)}
#mobileMenu i{width:22px;color:var(--muted)}

/* Hero */
.hero{position:relative;display:flex;align-items:center;min-height:360px;padding:48px 0;border-radius:var(--radius);overflow:hidden;margin:20px 20px 0;background:linear-gradient(135deg,#1a1a2e,#2d2d44)}
.hero::before{content:'';position:absolute;inset:0;background:url('https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?auto=format&fit=crop&w=1400&q=80') center/cover;opacity:.3}
.hero .container{position:relative;z-index:1}
.hero .badge{display:inline-block;background:rgba(224,122,95,.25);color:#ffd4c4;padding:4px 16px;border-radius:999px;font-weight:600;font-size:13px;margin-bottom:16px}
.hero h1{font-family:'Playfair Display',serif;font-size:46px;font-weight:700;color:#fff;line-height:1.15;max-width:600px;margin-bottom:16px}
.hero p{color:rgba(255,255,255,.8);font-size:17px;max-width:520px;margin-bottom:28px}
.hero .actions{display:flex;gap:12px;flex-wrap:wrap}

/* Section */
.section{padding:48px 0}
.section-header{display:flex;align-items:flex-end;justify-content:space-between;gap:16px;margin-bottom:28px;flex-wrap:wrap}
.section-header h2{font-size:26px;font-weight:700;letter-spacing:-.3px}
.section-header p{color:var(--muted);margin-top:4px;font-size:15px}

/* Movie cards */
.movies-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:20px}
.movie-card{background:var(--bg-card);border-radius:var(--radius);overflow:hidden;box-shadow:var(--shadow);transition:var(--transition);display:flex;flex-direction:column;border:2px solid transparent;cursor:pointer}
.movie-card:hover{transform:translateY(-6px);box-shadow:var(--shadow-hover);border-color:var(--accent-light)}
.movie-card.selected{border-color:var(--accent);box-shadow:0 0 0 4px var(--accent-light)}
.poster-wrap{position:relative;overflow:hidden;background:var(--surface);aspect-ratio:2/3}
.poster-wrap img{width:100%;height:100%;object-fit:cover;transition:var(--transition)}
.movie-card:hover .poster-wrap img{transform:scale(1.04)}
.rating-badge{position:absolute;top:12px;left:12px;background:rgba(0,0,0,.75);color:#fff;padding:4px 10px;border-radius:999px;font-size:12px;font-weight:700;display:flex;align-items:center;gap:4px}
.rating-badge i{color:#f5a623;font-size:11px}
.genre-tag{position:absolute;bottom:12px;left:12px;background:rgba(224,122,95,.9);color:#fff;padding:3px 10px;border-radius:999px;font-size:11px;font-weight:600;text-transform:uppercase;letter-spacing:.3px}
.movie-card .body{padding:16px 18px 14px;flex:1;display:flex;flex-direction:column;gap:4px}
.movie-card h5{font-size:16px;font-weight:700;line-height:1.3}
.movie-card .meta{font-size:13px;color:var(--muted)}
.price-row{display:flex;align-items:center;gap:8px;margin-top:6px}
.price{font-weight:700;font-size:17px;color:var(--accent)}
.price small{font-weight:400;font-size:12px;color:var(--muted)}
.movie-card .footer{padding:0 18px 18px}
.book-btn{width:100%;padding:10px;border-radius:var(--radius-sm);background:var(--primary);color:#fff;font-weight:600;font-size:14px;transition:var(--transition);display:flex;align-items:center;justify-content:center;gap:8px}
.book-btn:hover{background:var(--accent)}

/* Booking panel */
.booking-panel{background:var(--bg-card);border-radius:var(--radius);box-shadow:var(--shadow-hover);padding:32px;display:none;margin-top:24px;border:2px solid var(--accent-light)}
.booking-panel.active{display:block;animation:slideDown .3s ease}
@keyframes slideDown{from{opacity:0;transform:translateY(-12px)}to{opacity:1;transform:translateY(0)}}
.booking-panel h3{font-size:22px;font-weight:700;margin-bottom:4px}
.booking-panel .sub{color:var(--muted);font-size:14px;margin-bottom:24px}
.booking-layout{display:grid;grid-template-columns:1fr 320px;gap:32px}
.booking-info h4{font-size:15px;font-weight:700;margin-bottom:12px}
.booking-info h4 i{color:var(--accent);margin-right:6px}
.time-slots{display:flex;gap:10px;flex-wrap:wrap;margin-bottom:20px}
.time-slot{padding:10px 20px;border-radius:var(--radius-sm);border:2px solid rgba(26,26,46,.1);background:var(--bg);font-weight:600;font-size:14px;transition:var(--transition);text-align:center}
.time-slot:hover{border-color:var(--accent)}
.time-slot.selected{background:var(--accent);color:#fff;border-color:var(--accent)}
.time-slot small{display:block;font-weight:400;font-size:11px;opacity:.75}

.screen{background:linear-gradient(to bottom,var(--primary),var(--primary-light));height:10px;border-radius:50%/100% 100% 0 0;margin:24px 0 8px;position:relative}
.screen-label{text-align:center;font-size:11px;letter-spacing:3px;color:var(--muted-light);font-weight:600;margin-bottom:20px}

.seats-grid{display:grid;grid-template-columns:repeat(8,1fr);gap:8px;margin:0 auto 20px;max-width:440px}
.seat{aspect-ratio:1;border-radius:8px;background:var(--surface);border:2px solid transparent;display:grid;place-items:center;font-size:10px;font-weight:600;color:var(--muted-light);transition:var(--transition);cursor:pointer;user-select:none}
.seat:hover:not(.taken){background:var(--accent-light);border-color:var(--accent)}
.seat.selected{background:var(--accent);color:#fff;border-color:var(--accent-dark);transform:scale(1.08)}
.seat.taken{background:#e2e2e2;color:#bdbdbd;cursor:not-allowed}
.seat-legend{display:flex;gap:20px;font-size:13px;color:var(--muted);flex-wrap:wrap;justify-content:center}
.seat-legend span{display:flex;align-items:center;gap:6px}
.dot{width:16px;height:16px;border-radius:4px;display:inline-block}
.dot.available{background:var(--surface);border:2px solid #e0e0e0}
.dot.selected{background:var(--accent)}
.dot.taken{background:#e2e2e2}

.booking-summary{background:var(--bg);border-radius:var(--radius-sm);padding:24px;position:sticky;top:100px;align-self:start}
.booking-summary h4{font-size:16px;font-weight:700;margin-bottom:16px;padding-bottom:12px;border-bottom:1px solid rgba(26,26,46,.06)}
.summary-line{display:flex;justify-content:space-between;padding:8px 0;font-size:14px;color:var(--muted);gap:12px}
.summary-line span:last-child{font-weight:600;color:var(--primary);text-align:right}
.summary-total{display:flex;justify-content:space-between;padding:16px 0 0;margin-top:8px;border-top:2px solid rgba(26,26,46,.06);font-size:18px;font-weight:700}
.summary-total span:last-child{color:var(--accent)}
.booking-summary .btn{margin-top:20px}
.note{font-size:12px;color:var(--muted-light);text-align:center;margin-top:12px}
.selected-seats-display{font-size:13px;color:var(--muted);min-height:20px;margin:4px 0 8px}
.selected-seats-display strong{color:var(--primary)}

/* Modal */
.modal-overlay{position:fixed;inset:0;background:rgba(0,0,0,.5);backdrop-filter:blur(4px);z-index:200;display:none;align-items:center;justify-content:center;padding:20px}
.modal-overlay.active{display:flex}
.modal{background:#fff;border-radius:var(--radius);padding:40px;text-align:center;max-width:440px;width:100%;box-shadow:var(--shadow-hover);animation:popIn .3s ease}
@keyframes popIn{from{transform:scale(.9);opacity:0}to{transform:scale(1);opacity:1}}
.icon-circle{width:72px;height:72px;border-radius:50%;background:rgba(42,157,143,.12);color:var(--success);display:grid;place-items:center;font-size:32px;margin:0 auto 20px}
.modal h3{font-size:22px;font-weight:700;margin-bottom:8px}
.modal p{color:var(--muted);font-size:15px;margin-bottom:8px}
.modal .details{background:var(--bg);border-radius:var(--radius-sm);padding:16px;margin:16px 0 24px;text-align:left;font-size:14px}
.modal .details div{display:flex;justify-content:space-between;padding:4px 0;gap:12px}
.modal .details div span:first-child{color:var(--muted)}
.modal .details div span:last-child{font-weight:600;text-align:right}

/* Toast */
.toast{position:fixed;bottom:30px;left:50%;transform:translateX(-50%) translateY(100px);background:var(--primary);color:#fff;padding:14px 28px;border-radius:999px;font-size:14px;font-weight:600;box-shadow:var(--shadow-hover);z-index:300;opacity:0;transition:all .4s cubic-bezier(.4,0,.2,1);display:flex;align-items:center;gap:10px}
.toast.show{transform:translateX(-50%) translateY(0);opacity:1}
.toast i{color:var(--success)}

/* Footer */
footer{margin-top:16px;padding:44px 0 28px;border-top:1px solid rgba(26,26,46,.04)}
.footer-grid{display:grid;grid-template-columns:2fr 1fr 1fr 1fr;gap:40px;margin-bottom:32px}
.footer-grid .brand{font-size:20px;margin-bottom:8px}
.footer-grid p{color:var(--muted);font-size:14px;max-width:300px}
.socials{display:flex;gap:10px;margin-top:14px}
.socials a{width:40px;height:40px;border-radius:50%;background:var(--surface);display:grid;place-items:center;color:var(--muted);transition:var(--transition)}
.socials a:hover{background:var(--accent);color:#fff}
.footer-grid h5{font-weight:700;font-size:14px;margin-bottom:12px}
.footer-grid ul{list-style:none;display:flex;flex-direction:column;gap:6px}
.footer-grid ul a{color:var(--muted);font-size:14px}
.footer-grid ul a:hover{color:var(--accent)}
.footer-bottom{text-align:center;padding-top:20px;border-top:1px solid rgba(26,26,46,.04);color:var(--muted-light);font-size:13px}

/* Responsive */
@media(max-width:1100px){
  .movies-grid{grid-template-columns:repeat(3,1fr)}
  .booking-layout{grid-template-columns:1fr}
  .booking-summary{position:static}
}
@media(max-width:900px){
  .hero h1{font-size:34px}
  .hero{min-height:300px;margin:16px 16px 0;padding:36px 0}
  .footer-grid{grid-template-columns:1fr 1fr;gap:28px}
}
@media(max-width:768px){
  nav{display:none}
  .mobile-toggle{display:grid;place-items:center}
  .movies-grid{grid-template-columns:repeat(2,1fr);gap:14px}
  .hero h1{font-size:28px}
  .hero p{font-size:15px}
  .section-header h2{font-size:22px}
  .booking-panel{padding:20px}
  .seats-grid{grid-template-columns:repeat(8,1fr);gap:5px;max-width:100%}
  .footer-grid{grid-template-columns:1fr;gap:20px}
  .brand{font-size:18px}
  .brand i{font-size:20px}
  .header-actions .icon-btn{width:36px;height:36px;font-size:15px}
  .section{padding:32px 0}
}
@media(max-width:480px){
  .container{padding:0 14px}
  .movies-grid{grid-template-columns:1fr 1fr;gap:10px}
  .hero{margin:10px 10px 0;min-height:240px;padding:24px 0}
  .hero h1{font-size:22px}
  .hero .actions .btn{padding:10px 18px;font-size:13px}
  .movie-card .body{padding:12px 12px 8px}
  .movie-card h5{font-size:13px}
  .movie-card .footer{padding:0 12px 12px}
  .book-btn{font-size:12px;padding:8px}
  .seat{font-size:9px}
  .booking-panel{padding:16px}
  .time-slot{padding:8px 14px;font-size:13px}
  .modal{padding:28px 20px}
}
</style>
</head>
<body>

<!-- HEADER -->
<header>
  <div class="container header-inner">
    <div style="display:flex;align-items:center;gap:12px;">
      <button class="mobile-toggle" id="mobileToggle" aria-label="Toggle menu"><i class="fas fa-bars"></i></button>
      <a class="brand" href="#"><i class="fas fa-film"></i><span>Cine<span class="accent">Nexus</span></span></a>
    </div>
    <nav>
      <ul>
        <li><a href="#" class="active"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="#nowShowing"><i class="fas fa-fire"></i> Now Showing</a></li>
        <li><a href="#comingSoon"><i class="fas fa-clock"></i> Coming Soon</a></li>
        <li><a href="#"><i class="fas fa-ticket-alt"></i> My Tickets</a></li>
      </ul>
    </nav>
    <div class="header-actions">
      <button class="icon-btn" title="Search"><i class="fas fa-search"></i></button>
      <button class="icon-btn" title="Account"><i class="far fa-user"></i></button>
    </div>
  </div>
  <div id="mobileMenu">
    <div class="container">
      <ul>
        <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="#nowShowing"><i class="fas fa-fire"></i> Now Showing</a></li>
        <li><a href="#comingSoon"><i class="fas fa-clock"></i> Coming Soon</a></li>
        <li><a href="#"><i class="fas fa-ticket-alt"></i> My Tickets</a></li>
      </ul>
    </div>
  </div>
</header>

<!-- HERO -->
<section class="hero">
  <div class="container">
    <div class="badge"><i class="fas fa-star"></i> Now Booking</div>
    <h1>Book Your Movie<br>Tickets in Seconds</h1>
    <p>Choose a movie, pick your showtime, tap your seats, and you're done. Simple as that.</p>
    <div class="actions">
      <button class="btn btn-primary" onclick="document.getElementById('nowShowing').scrollIntoView({behavior:'smooth'})">
        <i class="fas fa-ticket-alt"></i> Book Now
      </button>
      <button class="btn btn-outline" onclick="document.getElementById('comingSoon').scrollIntoView({behavior:'smooth'})">
        <i class="fas fa-clock"></i> Coming Soon
      </button>
    </div>
  </div>
</section>

<!-- NOW SHOWING -->
<section class="section" id="nowShowing">
  <div class="container">
    <div class="section-header">
      <div>
        <h2>🎬 Now Showing</h2>
        <p>Pick a movie and book your seats instantly</p>
      </div>
    </div>
    <div class="movies-grid" id="moviesGrid"></div>

    <!-- BOOKING PANEL -->
    <div class="booking-panel" id="bookingPanel">
      <h3 id="bookingMovieTitle">Select a movie</h3>
      <p class="sub" id="bookingMovieMeta"></p>

      <div class="booking-layout">
        <div class="booking-info">
          <h4><i class="fas fa-clock"></i> Showtime</h4>
          <div class="time-slots" id="timeSlots"></div>

          <h4><i class="fas fa-couch"></i> Pick Your Seats</h4>
          <div class="screen"></div>
          <div class="screen-label">SCREEN THIS WAY</div>
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
          <div class="summary-total"><span>Total</span><span id="sumTotal">$0</span></div>
          <button class="btn btn-success btn-block" id="confirmBtn" disabled>
            <i class="fas fa-check"></i> Confirm Booking
          </button>
          <p class="note">You can pick up to 8 seats per booking.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- COMING SOON -->
<section class="section" id="comingSoon" style="background:var(--bg-card);border-radius:var(--radius);margin:0 20px;">
  <div class="container">
    <div class="section-header">
      <div>
        <h2>🎥 Coming Soon</h2>
        <p>Mark your calendar for these upcoming releases</p>
      </div>
    </div>
    <div class="movies-grid" id="comingGrid"></div>
  </div>
</section>

<!-- FOOTER -->
<footer>
  <div class="container">
    <div class="footer-grid">
      <div>
        <div class="brand"><i class="fas fa-film"></i><span>Cine<span class="accent">Nexus</span></span></div>
        <p>Your simple movie ticket booking experience. Pick a movie, tap seats, done.</p>
        <div class="socials">
          <a href="#"><i class="fab fa-facebook-f"></i></a>
          <a href="#"><i class="fab fa-twitter"></i></a>
          <a href="#"><i class="fab fa-instagram"></i></a>
          <a href="#"><i class="fab fa-youtube"></i></a>
        </div>
      </div>
      <div><h5>Company</h5><ul><li><a href="#">About</a></li><li><a href="#">Careers</a></li><li><a href="#">Press</a></li></ul></div>
      <div><h5>Support</h5><ul><li><a href="#">Help Center</a></li><li><a href="#">Refunds</a></li><li><a href="#">Contact</a></li></ul></div>
      <div><h5>Legal</h5><ul><li><a href="#">Privacy</a></li><li><a href="#">Terms</a></li></ul></div>
    </div>
    <div class="footer-bottom">&copy; <span id="year"></span> CineNexus. All rights reserved.</div>
  </div>
</footer>

<!-- SUCCESS MODAL -->
<div class="modal-overlay" id="modalOverlay">
  <div class="modal">
    <div class="icon-circle"><i class="fas fa-check"></i></div>
    <h3>Booking Confirmed!</h3>
    <p>Your tickets are booked. Enjoy the show 🍿</p>
    <div class="details" id="modalDetails"></div>
    <button class="btn btn-primary btn-block" id="modalCloseBtn"><i class="fas fa-thumbs-up"></i> Great!</button>
  </div>
</div>

<!-- TOAST -->
<div class="toast" id="toast"><i class="fas fa-check-circle"></i><span id="toastMsg">Done</span></div>

<script>
/* ============================================================
   DATA
============================================================ */
const MOVIES = [
  { id:1, title:'Dune: Part Two', genre:'Sci-Fi', rating:8.7, duration:'2h 46m', cert:'UA',
    price:12, img:'https://images.unsplash.com/photo-1536440136628-849c177e76a1?auto=format&fit=crop&w=600&q=80' },
  { id:2, title:'Oppenheimer', genre:'Drama', rating:8.4, duration:'3h 0m', cert:'A',
    price:14, img:'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?auto=format&fit=crop&w=600&q=80' },
  { id:3, title:'Spider-Man: No Way Home', genre:'Action', rating:8.2, duration:'2h 28m', cert:'UA',
    price:11, img:'https://images.unsplash.com/photo-1635805737707-575885ab0820?auto=format&fit=crop&w=600&q=80' },
  { id:4, title:'The Batman', genre:'Crime', rating:7.8, duration:'2h 56m', cert:'UA',
    price:11, img:'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?auto=format&fit=crop&w=600&q=80' },
  { id:5, title:'Interstellar', genre:'Sci-Fi', rating:8.7, duration:'2h 49m', cert:'UA',
    price:10, img:'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?auto=format&fit=crop&w=600&q=80' },
  { id:6, title:'Inception', genre:'Thriller', rating:8.8, duration:'2h 28m', cert:'UA',
    price:10, img:'https://images.unsplash.com/photo-1478720568477-152d9b164e26?auto=format&fit=crop&w=600&q=80' }
];

const COMING = [
  { id:101, title:'Avatar 3', genre:'Adventure', rating:0, duration:'TBA', cert:'UA',
    price:13, img:'https://images.unsplash.com/photo-1518676590629-3dcbd9c5a5c9?auto=format&fit=crop&w=600&q=80' },
  { id:102, title:'Deadpool 4', genre:'Action', rating:0, duration:'TBA', cert:'A',
    price:13, img:'https://images.unsplash.com/photo-1608889175123-8ee362201f81?auto=format&fit=crop&w=600&q=80' },
  { id:103, title:'Frozen 3', genre:'Animation', rating:0, duration:'TBA', cert:'U',
    price:10, img:'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?auto=format&fit=crop&w=600&q=80' },
  { id:104, title:'Mission: Impossible 8', genre:'Action', rating:0, duration:'TBA', cert:'UA',
    price:13, img:'https://images.unsplash.com/photo-1533929736458-ca588d08c8be?auto=format&fit=crop&w=600&q=80' }
];

const SHOWTIMES = ['10:30 AM','1:15 PM','4:00 PM','7:30 PM','10:15 PM'];
const ROWS = ['A','B','C','D','E','F'];
const SEATS_PER_ROW = 8;
const MAX_SEATS = 8;

/* Predefine some seats as already taken (per movie + time combo, we randomize on render) */
function generateSeats(seed){
  const seats = [];
  let rnd = seed;
  const rand = () => { rnd = (rnd * 9301 + 49297) % 233280; return rnd / 233280; };
  for(let r=0;r<ROWS.length;r++){
    for(let c=1;c<=SEATS_PER_ROW;c++){
      const id = ROWS[r] + c;
      // ~20% chance a seat is taken
      seats.push({ id, row:ROWS[r], col:c, taken: rand() < 0.22 });
    }
  }
  return seats;
}

/* ============================================================
   STATE
============================================================ */
const state = {
  selectedMovie: null,
  selectedTime: null,
  seats: [],
  selectedSeats: new Set()
};

/* ============================================================
   DOM
============================================================ */
const moviesGrid = document.getElementById('moviesGrid');
const comingGrid = document.getElementById('comingGrid');
const bookingPanel = document.getElementById('bookingPanel');
const bookingMovieTitle = document.getElementById('bookingMovieTitle');
const bookingMovieMeta = document.getElementById('bookingMovieMeta');
const timeSlotsEl = document.getElementById('timeSlots');
const seatsGridEl = document.getElementById('seatsGrid');
const sumMovie = document.getElementById('sumMovie');
const sumTime = document.getElementById('sumTime');
const sumSeats = document.getElementById('sumSeats');
const sumTotal = document.getElementById('sumTotal');
const selectedSeatsDisplay = document.getElementById('selectedSeatsDisplay');
const confirmBtn = document.getElementById('confirmBtn');
const modalOverlay = document.getElementById('modalOverlay');
const modalDetails = document.getElementById('modalDetails');
const toast = document.getElementById('toast');
const toastMsg = document.getElementById('toastMsg');

/* ============================================================
   HELPERS
============================================================ */
function escapeHtml(s){return String(s).replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]))}

function showToast(msg){
  toastMsg.textContent = msg;
  toast.classList.add('show');
  clearTimeout(showToast._t);
  showToast._t = setTimeout(()=>toast.classList.remove('show'),2200);
}

/* ============================================================
   RENDER: Movies
============================================================ */
function renderMovies(list, container, coming=false){
  container.innerHTML = '';
  list.forEach(m=>{
    const card = document.createElement('article');
    card.className = 'movie-card';
    card.dataset.id = m.id;
    const ratingHtml =
