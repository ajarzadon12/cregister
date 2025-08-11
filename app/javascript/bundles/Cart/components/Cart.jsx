import PropTypes from 'prop-types';
import React from 'react';

import Box from '@mui/material/Box';
import Container from '@mui/material/Container';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Typography from '@mui/material/Typography';
import Paper from '@mui/material/Paper';
import { v4 as uuidv4 } from 'uuid';

const Cart = (props) => {
  const {
    data: {
      attributes: {
        cart_products: cartProducts,
        total_price: totalPrice
      }
    }
  } = props.cart;

  return (
    <Container maxWidth="md" sx={{ mt: 4 }}>
      <Typography variant="h4" component="h1" gutterBottom>Cart</Typography>
      <TableContainer component={Paper}>
        <Table sx={{ minWidth: 650 }} aria-label="cart">
          <TableHead>
            <TableRow>
              <TableCell>Product code</TableCell>
              <TableCell>Name</TableCell>
              <TableCell>Unit Price</TableCell>
              <TableCell>Quantity</TableCell>
              <TableCell>Subtotal</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {cartProducts.map((product) => (
              <TableRow key={uuidv4()}>
                <TableCell component="th" scope="row">
                  {product.code}
                </TableCell>
                <TableCell>{product.name}</TableCell>
                <TableCell>{product.unit_price}</TableCell>
                <TableCell>{product.quantity}</TableCell>
                <TableCell>{product.subtotal}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
      <Box sx={{ flexGrow: 1, justifyContent: 'flex-end', display: { xs: 'flex' }, mr: 10, mt: 2, gap: 2 }}>
        <Typography variant="h5" component="h5" gutterBottom>Total:</Typography>
        <Typography variant="h5" component="h5" gutterBottom>{totalPrice}</Typography>
      </Box>
    </Container>
  );
};

Cart.propTypes = {
  cart: PropTypes.shape({
    data: PropTypes.arrayOf(
      PropTypes.shape({
        attributes: PropTypes.shape({
          products: PropTypes.shape({
            code: PropTypes.string.isRequired,
            name: PropTypes.string.isRequired,
            unit_price: PropTypes.number.isRequired,
            quantity: PropTypes.number.isRequired,
            subtotal: PropTypes.number.isRequired,
          }),
          total_price: PropTypes.number.isRequired,
        }).isRequired,
      })
    )
  }).isRequired,
};

export default Cart;
