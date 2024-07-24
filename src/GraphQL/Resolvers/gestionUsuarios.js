import { db1, db2 } from '../../postgresdb'
import { ApolloError } from 'apollo-server-core'

function calcularDiferenciaHoras(fechaInicio, fechaFin) {
  const inicio = new Date(fechaInicio)
  const fin = new Date(fechaFin)

  let diferenciaEnMilisegundos = fin - inicio
  const milisegundosEnUnaHora = 1000 * 60 * 60

  const horas = Math.floor(diferenciaEnMilisegundos / milisegundosEnUnaHora)
  diferenciaEnMilisegundos -= horas * milisegundosEnUnaHora

  const minutos = Math.floor(diferenciaEnMilisegundos / (1000 * 60))
  diferenciaEnMilisegundos -= minutos * 60 * 1000

  const segundos = Math.floor(diferenciaEnMilisegundos / 1000)

  return { horas, minutos, segundos }
}

function detectarHorario(
  feIniRegUser,
  feFinRegUser,
  feIniHorario,
  feFinHorario
) {
  const inicio = new Date(feIniRegUser)
  const fin = new Date(feFinRegUser)
  const inicioHorario = new Date(feIniHorario)
  const finHorario = new Date(feFinHorario)

  if (inicio <= inicioHorario && fin >= inicioHorario && fin <= finHorario) {
    const { horas: horasAntesHorario, minutos: minutosAntesHorario } =
      calcularDiferenciaHoras(inicio, inicioHorario)

    const { horas: horasDentroHorario, minutos: minutosDentroHorario } =
      calcularDiferenciaHoras(inicioHorario, fin)

    const { horas: horasDespuesHorario, minutos: minutosDespuesHorario } = 0

    return {
      condition: true,
      horasAntesHorario,
      minutosAntesHorario,
      horasDentroHorario,
      minutosDentroHorario,
      horasDespuesHorario,
      minutosDespuesHorario
    }
  } else if (
    inicio >= inicioHorario &&
    inicio <= finHorario &&
    fin <= finHorario &&
    fin >= inicioHorario
  ) {
    const { horas: horasAntesHorario, minutos: minutosAntesHorario } = 0

    const { horas: horasDentroHorario, minutos: minutosDentroHorario } =
      calcularDiferenciaHoras(inicio, fin)

    const { horas: horasDespuesHorario, minutos: minutosDespuesHorario } = 0

    return {
      condition: true,
      horasAntesHorario,
      minutosAntesHorario,
      horasDentroHorario,
      minutosDentroHorario,
      horasDespuesHorario,
      minutosDespuesHorario
    }
  } else if (
    inicio >= inicioHorario &&
    inicio <= finHorario &&
    fin >= finHorario &&
    fin >= inicioHorario
  ) {
    const { horas: horasAntesHorario, minutos: minutosAntesHorario } = 0

    const { horas: horasDentroHorario, minutos: minutosDentroHorario } =
      calcularDiferenciaHoras(inicio, finHorario)

    const { horas: horasDespuesHorario, minutos: minutosDespuesHorario } =
      calcularDiferenciaHoras(finHorario, fin)

    return {
      condition: true,
      horasAntesHorario,
      minutosAntesHorario,
      horasDentroHorario,
      minutosDentroHorario,
      horasDespuesHorario,
      minutosDespuesHorario
    }
  } else if (inicio < inicioHorario && fin > finHorario) {
    const { horas: horasAntesHorario, minutos: minutosAntesHorario } =
      calcularDiferenciaHoras(inicio, inicioHorario)

    const { horas: horasDentroHorario, minutos: minutosDentroHorario } =
      calcularDiferenciaHoras(inicioHorario, finHorario)

    const { horas: horasDespuesHorario, minutos: minutosDespuesHorario } =
      calcularDiferenciaHoras(finHorario, fin)

    return {
      condition: true,
      horasAntesHorario,
      minutosAntesHorario,
      horasDentroHorario,
      minutosDentroHorario,
      horasDespuesHorario,
      minutosDespuesHorario
    }
  } else {
    return false
  }
}

export default {
  Query: {
    getUsuarios: async (_, { cedula }, { auth }) => {
      // if (!auth) throw new ApolloError('Sesión no válida')

      try {
        const datoPrueba = await db2.query(
          `SELECT Userid, Name, CardNum FROM biometer.dbo.Userinfo WHERE CardNum = '${cedula}';`
        )

        const registrosMov = await db2.query(
          `SELECT CheckTime FROM biometer.dbo.Checkinout WHERE Userid = ${parseInt(
            datoPrueba.recordset[0].Userid
          )} AND CheckTime BETWEEN '2017-01-02' AND '2017-01-03' Order by Logid ASC`
        )

        /* SELECT d1.Deptid, d1.DeptName, 
          (SELECT d2.Deptid FROM biometer.dbo.Dept d2 WHERE d2.Deptid = d1.SupDeptid) as dep_padre,
          (SELECT d2.DeptName FROM biometer.dbo.Dept d2 WHERE d2.Deptid = d1.SupDeptid) as dep_padre 
          FROM biometer.dbo.Dept d1;
          */

        const { horas: caculoHoras, minutos: caculoMinutos } =
          calcularDiferenciaHoras(
            registrosMov.recordset[0].CheckTime,
            registrosMov.recordset[1].CheckTime
          )

        const {
          condition,
          horasAntesHorario,
          minutosAntesHorario,
          horasDentroHorario,
          minutosDentroHorario,
          horasDespuesHorario,
          minutosDespuesHorario
        } = detectarHorario(
          registrosMov.recordset[0].CheckTime,
          registrosMov.recordset[1].CheckTime,
          '2017-01-02T08:30:00.000Z',
          '2017-01-02T16:30:00.000Z'
        )

        console.log(datoPrueba.recordset[0])
        console.log(registrosMov.recordset)
        console.log('Horas: ' + caculoHoras + ' minutos: ' + caculoMinutos)
        console.log(
          'Horario cumplido: ' +
            condition +
            ' TiempoAntesHorario ' +
            horasAntesHorario +
            ':' +
            minutosAntesHorario +
            ' TiempoDentroHorario ' +
            horasDentroHorario +
            ':' +
            minutosDentroHorario +
            ' TiempoDespuesHorario ' +
            horasDespuesHorario +
            ':' +
            minutosDespuesHorario
        )

        /* console.log(
          registrosMov.recordset[0].CheckTime,
          registrosMov.recordset[1].CheckTime,
          '2017-01-02T07:00:00.000Z',
          '2017-01-02T19:00:00.000Z'
        ) */

        const usuarios =
          await db1.manyOrNone(`SELECT u.co_usuario, u.ced_usuario, u.nb_usuario, u.ap_usuario, r.nb_rol, u.tx_correo, u.status_register
            FROM public.d008t_usuarios u, public.i005t_roles r WHERE u.co_rol =  r.co_rol;`)

        return usuarios
      } catch (e) {
        throw new ApolloError(e.message)
      }
    },
    getRoles: async (_, __, { auth }) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      try {
        const roles =
          await db1.manyOrNone(`SELECT DISTINCT co_rol code, nb_rol as name
          FROM public.i005t_roles ORDER BY co_rol;`)

        return roles
      } catch (e) {
        throw new ApolloError(e.message)
      }
    },
    getRol: async (_, { codeRol }, { auth }) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      try {
        const rol = await db1.manyOrNone(
          `SELECT ro.co_rol code, p.tx_permisos permisos, p.id_permiso idpermiso, ru.nb_ruta ruta
          FROM public.i005t_roles ro, public.d013t_permisos p, public.i009t_rutas ru where ro.co_rol = p.co_rol AND p.id_ruta = ru.id_ruta AND ro.co_rol = $1 ORDER BY p.id_permiso;`,
          [codeRol]
        )

        return rol
      } catch (e) {
        throw new ApolloError(e.message)
      }
    },
    getRutas: async (_, __, { auth }) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      try {
        const rutas = await db1.manyOrNone(`SELECT id_ruta code, nb_ruta as name
          FROM public.i009t_rutas;`)

        return rutas
      } catch (e) {
        throw new ApolloError(e.message)
      }
    }
  },
  Mutation: {
    crearUsuario: async (_, { InputGuardarUsuario }, { auth }) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      try {
        const {
          ced_usuario,
          nb_usuario,
          nb2_usuario,
          ap_usuario,
          ap2_usuario,
          co_rol
        } = InputGuardarUsuario

        const usuarioError = await db1.oneOrNone(
          `SELECT co_usuario FROM public.d008t_usuarios WHERE ced_usuario = $1`,
          [ced_usuario]
        )

        if (usuarioError !== null) {
          return {
            status: 400,
            message: 'El usuario ya se encuentra registrado',
            type: 'error'
          }
        } else {
          await db1.none(
            `INSERT INTO public.d008t_usuarios
            (ced_usuario, nu_clave, nb_usuario, ap_usuario, ap2_usuario, nb2_usuario, co_rol)
            VALUES($1, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', $2, $3, $4, $5, $6)`,
            [
              ced_usuario,
              nb_usuario,
              ap_usuario,
              ap2_usuario,
              nb2_usuario,
              co_rol
            ]
          )

          return {
            status: 200,
            message: 'El usuario fue registrado exitosamente',
            type: 'success'
          }
        }
      } catch (e) {
        throw new ApolloError(e.message)
      }
    },
    crearRolPermiso: async (
      _,
      { InputRolPermisos, plusPermisos },
      { auth }
    ) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      try {
        const { nombre, ruta, permisos, id_rol } = InputRolPermisos

        const rolExistente = await db1.oneOrNone(
          `SELECT co_rol FROM public.i005t_roles WHERE nb_rol = $1`,
          [nombre]
        )

        if (rolExistente && plusPermisos === false) {
          return {
            status: 210,
            message: 'El rol ya se encuentra registrado',
            type: 'warn'
          }
        } else if (id_rol && plusPermisos === true) {
          const co_rol = await db1.oneOrNone(
            `SELECT co_rol FROM public.i005t_roles WHERE co_rol = $1`,
            [id_rol]
          )

          const errorPermisoRol = await db1.oneOrNone(
            `SELECT id_permiso
              FROM public.d013t_permisos WHERE co_rol = $1 and id_ruta = $2;`,
            [co_rol.co_rol, ruta]
          )

          if (errorPermisoRol) {
            return {
              status: 400,
              message: 'El rol ya posee el permiso',
              type: 'error'
            }
          }

          const menu = await db1.oneOrNone(
            `SELECT tx_menu
            FROM public.i010t_menus WHERE co_rol = $1;`,
            [id_rol]
          )

          const itemsRuta = await db1.manyOrNone(
            `SELECT json_item
            FROM public.i011t_items_menu WHERE id_ruta = $1`,
            [ruta]
          )

          const arrayItemsRuta = menu.tx_menu

          for (let i = 0; i < itemsRuta.length; i++) {
            arrayItemsRuta.push(itemsRuta[i].json_item)
          }

          const jsonItemsRuta = JSON.stringify(arrayItemsRuta)

          await db1.none(
            `INSERT INTO public.d013t_permisos
              (co_rol, id_ruta, tx_permisos)
              VALUES($1, $2, $3)`,
            [co_rol.co_rol, ruta, permisos]
          )

          await db1.none(
            `UPDATE public.i010t_menus
            SET tx_menu=$1
            WHERE co_rol=$2;`,
            [jsonItemsRuta, co_rol.co_rol]
          )

          return {
            status: 200,
            message: 'Al rol se le agregaron permisos exitosamente',
            type: 'success'
          }
        } else {
          const itemsRuta = await db1.manyOrNone(
            `SELECT json_item
            FROM public.i011t_items_menu WHERE id_ruta = $1`,
            [ruta]
          )
          const arrayItemsRuta = []

          for (let i = 0; i < itemsRuta.length; i++) {
            arrayItemsRuta.push(itemsRuta[i].json_item)
          }

          const jsonItemsRuta = JSON.stringify(arrayItemsRuta)

          await db1.none(
            `INSERT INTO public.i005t_roles
            (nb_rol)
            VALUES($1)`,
            [nombre]
          )

          const co_rol = await db1.oneOrNone(
            `SELECT co_rol FROM public.i005t_roles WHERE nb_rol = $1`,
            [nombre]
          )

          await db1.none(
            `INSERT INTO public.d013t_permisos
            (co_rol, id_ruta, tx_permisos)
            VALUES($1, $2, $3)`,
            [co_rol.co_rol, ruta, permisos]
          )

          await db1.none(
            `INSERT INTO public.i010t_menus
            (co_rol, tx_menu)
            VALUES($1, $2);`,
            [co_rol.co_rol, jsonItemsRuta]
          )

          return {
            status: 200,
            message: 'El rol se ha registrado exitosamente',
            type: 'success',
            response: co_rol.co_rol
          }
        }
      } catch (e) {
        throw new ApolloError(e.message)
      }
    },
    eliminarUsuario: async (_, { cedulaUsuario }, { auth }) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      try {
        const usuarioError = await db1.oneOrNone(
          `SELECT co_usuario FROM public.d008t_usuarios WHERE ced_usuario = $1`,
          [cedulaUsuario]
        )

        const co_personal = await db1.oneOrNone(
          `SELECT co_personal FROM public.d009t_personal WHERE co_usuario = $1;`,
          [usuarioError.co_usuario]
        )

        if (usuarioError !== null) {
          if (co_personal?.co_personal) {
            const coPersonal = co_personal.co_personal

            const horario_personal = await db1.oneOrNone(
              `SELECT co_horario_personal FROM public.d011t_horarios_personal WHERE co_personal = $1;`,
              [coPersonal]
            )

            const especialidad_personal = await db1.oneOrNone(
              `SELECT co_especialidad_personal FROM public.d010t_especialidad_personal WHERE co_personal = $1;`,
              [coPersonal]
            )

            if (horario_personal) {
              await db1.none(
                `DELETE FROM public.d011t_horarios_personal
                WHERE co_personal=$1;
                `,
                [coPersonal]
              )
            }

            if (especialidad_personal) {
              await db1.none(
                `DELETE FROM public.d010t_especialidad_personal
                WHERE co_personal=$1;
                `,
                [coPersonal]
              )
            }

            if (co_personal) {
              await db1.none(
                `DELETE FROM public.d009t_personal
                WHERE co_personal=$1;
                `,
                [coPersonal]
              )
            }
          }

          await db1.none(
            `DELETE FROM public.d008t_usuarios
            WHERE ced_usuario=$1
            `,
            [cedulaUsuario]
          )

          return {
            status: 200,
            message: 'El usuario fue eliminado exitosamente',
            type: 'error'
          }
        } else {
          return {
            status: 400,
            message: 'El usuario no se encuentra registrado',
            type: 'error'
          }
        }
      } catch (e) {
        throw new ApolloError(e.message)
      }
    },
    eliminarRol: async (_, { codRol }, { auth }) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      try {
        const rolUsuarioError = await db1.manyOrNone(
          `SELECT co_usuario FROM public.d008t_usuarios WHERE co_rol = $1;`,
          [codRol]
        )

        const rolError = await db1.oneOrNone(
          `SELECT nb_rol, co_rol
          FROM public.i005t_roles WHERE co_rol=$1;
          `,
          [codRol]
        )

        if (rolUsuarioError.length >= 1) {
          return {
            status: 404,
            message: 'El rol no puede ser eliminado porque lo posee un usuario',
            type: 'error'
          }
        }

        if (rolError !== null) {
          await db1.none(
            `DELETE FROM public.d013t_permisos
              WHERE co_rol=$1;
               `,
            [rolError?.co_rol]
          )

          await db1.none(
            `DELETE FROM public.i010t_menus
              WHERE co_rol=$1;
             `,
            [rolError?.co_rol]
          )

          await db1.none(
            `DELETE FROM public.i005t_roles
            WHERE co_rol=$1;
             `,
            [rolError?.co_rol]
          )

          return {
            status: 200,
            message: 'El rol fue eliminado exitosamente',
            type: 'error'
          }
        } else {
          return {
            status: 400,
            message: 'El rol no se encuentra registrado',
            type: 'error'
          }
        }
      } catch (e) {
        throw new ApolloError(e.message)
      }
    },
    resetUser: async (_, { co_usuario }, { auth }) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      try {
        await db1.none(
          `UPDATE public.d008t_usuarios SET status_register = true WHERE co_usuario = $1;`,
          [co_usuario]
        )

        return {
          status: 200,
          message: 'El usuario fue reiniciado exitosamente',
          type: 'success'
        }
      } catch (e) {
        throw new ApolloError(e.message)
      }
    },
    actualizarPermisosRol: async (
      _,
      { codPermiso, arrayPermisos },
      { auth }
    ) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      try {
        const permiso = await db1.oneOrNone(
          `SELECT id_permiso, co_rol, id_ruta, tx_permisos
          FROM public.d013t_permisos WHERE id_permiso = $1;
          
          `,
          [codPermiso]
        )

        if (permiso !== null) {
          await db1.none(
            `UPDATE public.d013t_permisos
            SET tx_permisos = $2
            WHERE id_permiso = $1;`,
            [codPermiso, arrayPermisos]
          )
          return {
            status: 200,
            message: 'Se actualizo el permiso exitosamente',
            type: 'success'
          }
        } else {
          return {
            status: 400,
            message: 'El permiso no se encuentra registrado',
            type: 'error'
          }
        }
      } catch (e) {
        throw new ApolloError(e.message)
      }
    },
    eliminarPermisosRol: async (_, { codPermiso, co_rol }, { auth }) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      try {
        const permiso = await db1.oneOrNone(
          `SELECT id_permiso, co_rol, id_ruta, tx_permisos
          FROM public.d013t_permisos WHERE id_permiso = $1;
          
          `,
          [codPermiso]
        )

        const CantPermiso = await db1.manyOrNone(
          `SELECT id_permiso, co_rol, id_ruta, tx_permisos
          FROM public.d013t_permisos WHERE co_rol = $1;
          
          `,
          [co_rol]
        )

        if (CantPermiso.length > 1) {
          if (permiso !== null) {
            await db1.none(
              `DELETE FROM public.d013t_permisos
              WHERE id_permiso = $1;`,
              [codPermiso]
            )

            const reConstrucMenu = await db1.manyOrNone(
              `SELECT id_permiso, co_rol, id_ruta, tx_permisos
              FROM public.d013t_permisos WHERE co_rol = $1;
              
              `,
              [permiso.co_rol]
            )

            const arrayIdRutas = []

            if (reConstrucMenu) {
              reConstrucMenu.map((permiso) => {
                arrayIdRutas.push(permiso.id_ruta)

                return false
              })
            }

            /* const tuplaIdRutas = `(${arrayIdRutas.join(',')})` */

            if (arrayIdRutas.length >= 1) {
              const itemsMenuRutas = []

              for (let i = 0; i < arrayIdRutas.length; i++) {
                const itemsMenu = await db1.oneOrNone(
                  `SELECT id_ruta, json_item FROM public.i011t_items_menu WHERE id_ruta = $1`,
                  [arrayIdRutas[i]]
                )

                itemsMenuRutas.push(itemsMenu.json_item)
              }

              const jsonItemsRuta = JSON.stringify(itemsMenuRutas)

              await db1.none(
                `UPDATE public.i010t_menus
                  SET tx_menu = $2
                  WHERE co_rol = $1;`,
                [permiso.co_rol, jsonItemsRuta]
              )
            } else {
              return {
                status: 404,
                message: 'Error al crear el menu',
                type: 'error'
              }
            }
          }

          return {
            status: 200,
            message: 'El permiso fue eliminado exitosamente',
            type: 'error'
          }
        } else {
          return {
            status: 400,
            message: 'Error no se puede eliminar el ultimo permiso del rol',
            type: 'error'
          }
        }
      } catch (e) {
        throw new ApolloError(e.message)
      }
    }
  }
}
