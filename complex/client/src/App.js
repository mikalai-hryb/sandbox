import logo from './logo.svg';
import './App.css';
import { BrouserRouter as Router, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1>Welcome to React.</h1>
          <Link to="/">Home</Link>
          <Link to="/other-page">Other Page</Link>
        </header>
        <div>
          <Route exact path="/" component={Fib} />
          <Route path="/other-page" component={OtherPage} />
        </div>
      </div>
    </Router>
  );
}

export default App;
