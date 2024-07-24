import { db1 } from '../../postgresdb'

export default {
  Query: {
    consultaPrueba: async (_, __) => {
      const dataUser = await db1.manyOrNone(
        'select * from public.d008t_usuarios'
      )
      return dataUser
    }
  }
}
