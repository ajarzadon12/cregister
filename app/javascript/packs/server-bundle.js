import ReactOnRails from 'react-on-rails';

import Cart from '../bundles/Cart/components/Cart';
import Header from '../bundles/Header/components/Header';
import ProductsTable from '../bundles/ProductsTable/components/ProductsTableServer';

ReactOnRails.register({
  Cart,
  Header,
  ProductsTable,
});
