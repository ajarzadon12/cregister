import PropTypes from 'prop-types';
import React, { useState } from 'react';

import Button from '@mui/material/Button';
import Container from '@mui/material/Container';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import TextField from '@mui/material/TextField';
import Typography from '@mui/material/Typography';
import Paper from '@mui/material/Paper';
import { v4 as uuidv4 } from 'uuid';

const ProductsTable = (props) => {
  const { data: products } = props.products;
  const [cart, setCart] = useState(props.cart);
  const csrfToken = document.getElementsByName('csrf-token')[0].content;

  const addToCart = async (code) => {
    const response = await fetch(`/products/${code}/add_to_cart`, {
      method: 'PUT',
      credentials: 'same-origin',
      headers: {
        'X-CSRF-Token': csrfToken,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({})
    });

    const response_json = await response.json();
    setCart(response_json.cart);
  };

  const removeFromCart = async (code) => {
    const response = await fetch(`/products/${code}/remove_from_cart`, {
      method: 'PUT',
      credentials: 'same-origin',
      headers: {
        'X-CSRF-Token': csrfToken,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({})
    });
    
    const response_json = await response.json();
    setCart(response_json.cart);
  };

  const setProductQty = (event, code) => {
    const quantity = event.target.value;

    if (quantity > cart[code]) {
      addToCart(code);
    } else {
      removeFromCart(code);
    }
  };

  return (
    <Container maxWidth="md" sx={{ mt: 4 }}>
      <Typography variant="h4" component="h1" gutterBottom>Products</Typography>
      <TableContainer component={Paper}>
        <Table sx={{ minWidth: 650 }} aria-label="products table">
          <TableHead>
            <TableRow>
              <TableCell>Product code</TableCell>
              <TableCell>Name</TableCell>
              <TableCell>Price</TableCell>
              <TableCell></TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {products.map((product) => (
              <TableRow key={uuidv4()}>
                <TableCell component="th" scope="row">
                  {product.attributes.code}
                </TableCell>
                <TableCell>{product.attributes.name}</TableCell>
                <TableCell>{product.attributes.price}</TableCell>
                <TableCell align="right">
                  {cart && cart[product.attributes.code] == null ? (
                    <Button variant="contained" onClick={ () => addToCart(product.attributes.code) }>
                      Add to cart
                    </Button>
                  ) : (
                    <TextField
                      inputProps={{ type: 'number'}}
                      aria-label="number input"
                      value={cart[product.attributes.code]}
                      onChange={(event) => setProductQty(event, product.attributes.code)}
                    />
                  )}
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </Container>
  );
};

ProductsTable.propTypes = {
  products: PropTypes.shape({
    data: PropTypes.arrayOf(
      PropTypes.shape({
        attributes: PropTypes.shape({
          code: PropTypes.string.isRequired,
          name: PropTypes.string.isRequired,
          price: PropTypes.string.isRequired,
        }),
      }).isRequired,
    )
  }).isRequired,
  cart: PropTypes.shape()
};

export default ProductsTable;
